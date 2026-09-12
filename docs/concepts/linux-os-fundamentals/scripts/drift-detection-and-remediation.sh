#!/usr/bin/env bash
# last_verified: 2026-09-12 · Linux & OS Fundamentals (concept, no tool version)
#
# Drift detection + idempotent remediation for a small set of Linux state.
# Compares the live host against a desired-state manifest and fixes drift
# (users, groups, service state, file mode) without re-running everything.
#
# Usage:
#   ./drift-detection-and-remediation.sh            # report only
#   ./drift-detection-and-remediation.sh --apply    # report + fix drift
#
# Designed to be run from an ansible-pull systemd timer or manually.

APPLY=0
if [ "${1:-}" = "--apply" ]; then
    APPLY=1
fi

# Desired state. Format: <kind> <name> <expected>
#   user    <name>    <uid>:<gid>:<shell>
#   group   <name>    <gid>
#   service <name>    <running|stopped|masked>
#   file    <path>    <mode>:<owner>:<group>
DESIRED=(
    "user    deploy    1001:1001:/bin/bash"
    "group   deploy    1001"
    "service nginx     running"
    "file    /etc/nginx/nginx.conf  0644:root:root"
)

overall=0

# Each check returns 0 on match, 1 on drift. The caller prints the line.
check_user() {
    local name="$1" uid="$2" gid="$3" shell="$4"
    if ! id -u "$name" >/dev/null 2>&1; then
        echo "  -> missing user $name"
        [ "$APPLY" = 1 ] && useradd -u "$uid" -g "$gid" -s "$shell" "$name"
        return 1
    fi
    local cur_uid cur_shell changed=0
    cur_uid=$(id -u "$name")
    cur_shell=$(getent passwd "$name" | cut -d: -f7)
    if [ "$cur_uid" != "$uid" ]; then
        echo "  -> uid $cur_uid != $uid"; changed=1
        [ "$APPLY" = 1 ] && usermod -u "$uid" "$name"
    fi
    if [ "$cur_shell" != "$shell" ]; then
        echo "  -> shell $cur_shell != $shell"; changed=1
        [ "$APPLY" = 1 ] && usermod -s "$shell" "$name"
    fi
    return "$changed"
}

check_group() {
    local name="$1" gid="$2"
    local cur_gid
    cur_gid=$(getent group "$name" | cut -d: -f3)
    if [ -z "$cur_gid" ]; then
        echo "  -> missing group $name"
        [ "$APPLY" = 1 ] && groupadd -g "$gid" "$name"
        return 1
    fi
    if [ "$cur_gid" != "$gid" ]; then
        echo "  -> gid $cur_gid != $gid"
        [ "$APPLY" = 1 ] && groupmod -g "$gid" "$name"
        return 1
    fi
    return 0
}

check_service() {
    local name="$1" want="$2"
    local state
    state=$(systemctl is-active "$name" 2>/dev/null || echo "inactive")
    if [ "$state" = "$want" ]; then
        return 0
    fi
    echo "  -> service $name is $state, want $want"
    if [ "$want" = "masked" ]; then
        [ "$APPLY" = 1 ] && systemctl mask "$name"
    else
        [ "$APPLY" = 1 ] && systemctl "$want" "$name"
    fi
    return 1
}

check_file() {
    local path="$1" mode="$2" owner="$3" group="$4"
    if [ ! -e "$path" ]; then
        echo "  -> missing file $path"
        return 1
    fi
    local cur_mode cur_owner cur_group changed=0
    cur_mode=$(stat -c '%a' "$path")
    cur_owner=$(stat -c '%U' "$path")
    cur_group=$(stat -c '%G' "$path")
    if [ "$cur_mode" != "$mode" ]; then
        echo "  -> mode $cur_mode != $mode"; changed=1
        [ "$APPLY" = 1 ] && chmod "$mode" "$path"
    fi
    if [ "$cur_owner" != "$owner" ]; then
        echo "  -> owner $cur_owner != $owner"; changed=1
        [ "$APPLY" = 1 ] && chown "$owner" "$path"
    fi
    if [ "$cur_group" != "$group" ]; then
        echo "  -> group $cur_group != $group"; changed=1
        [ "$APPLY" = 1 ] && chgrp "$group" "$path"
    fi
    return "$changed"
}

for entry in "${DESIRED[@]}"; do
    read -r kind name rest <<<"$entry"
    case "$kind" in
        user)
            IFS=':' read -r uid gid shell <<<"$rest"
            if check_user "$name" "$uid" "$gid" "$shell"; then
                echo "OK    user $name"
            else
                echo "DRIFT user $name"; overall=1
            fi
            ;;
        group)
            if check_group "$name" "$rest"; then
                echo "OK    group $name"
            else
                echo "DRIFT group $name"; overall=1
            fi
            ;;
        service)
            if check_service "$name" "$rest"; then
                echo "OK    service $name"
            else
                echo "DRIFT service $name"; overall=1
            fi
            ;;
        file)
            IFS=':' read -r mode owner group <<<"$rest"
            if check_file "$name" "$mode" "$owner" "$group"; then
                echo "OK    file $name"
            else
                echo "DRIFT file $name"; overall=1
            fi
            ;;
    esac
done

if [ "$overall" -eq 0 ]; then
    echo "No drift detected."
else
    if [ "$APPLY" = 1 ]; then
        echo "Drift remediated."
    else
        echo "Drift detected. Re-run with --apply to fix."
    fi
fi

exit "$overall"