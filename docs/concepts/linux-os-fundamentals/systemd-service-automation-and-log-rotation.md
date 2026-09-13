---
last_verified: 2026-09-12
tool_version: n/a
sources:
  - https://www.baeldung.com/ops/ansible-control-systemd
  - https://dev.to/lyraalishaikh/from-push-to-pull-gitops-style-linux-automation-with-ansible-pull-systemd-timers-490a
---

# systemd service automation and log rotation

## Purpose

This note covers the two Linux primitives that show up in almost every production service loop: getting a long-running process under systemd control, and keeping its logs from filling the disk. The angle here is the *automation* pattern — how a config-management tool or a pull-based agent turns these manual steps into something repeatable and self-healing.

## The systemd service loop

The canonical automation pattern is: ship a unit file, symlink it into place, reload the daemon, and start the service. In Ansible that looks like:

```yaml
- name: drop the unit file
  ansible.builtin.file:
    src: files/myapp.service
    dest: /etc/systemd/system/myapp.service
    state: link

- name: enable and start
  ansible.builtin.systemd:
    enabled: true
    state: started
    daemon_reload: true
```

A few things that bite early:

- The `.service` suffix is optional in `systemctl` commands — `systemctl start myapp` works even though the file is `myapp.service`. Don't panic when the bare name resolves.
- A `masked` unit cannot be started at all. If a previous run masked the service, `state: started` silently fails; unmask first with `ansible.builtin.command: systemctl unmask myapp`.
- `daemon_reload: true` is required whenever the unit file itself changed. Skipping it is the classic reason a freshly-written unit "does nothing."

For intermittently connected hosts, the pull variant is `ansible-pull`: a systemd oneshot timer fires on a schedule, pulls the Git repo, and applies a playbook with `connection: local`. The host heals its own drift without anyone pushing to it.

## Log rotation

systemd services emit to the journal by default, and `journald` rotates automatically. But two cases need an explicit policy:

1. **Services that bypass the journal.** Anything writing directly to `/var/log/myapp/*.log` (old-style daemons, custom writers) needs `logrotate`. A minimal `/etc/logrotate.d/myapp`:

```
/var/log/myapp/*.log {
    daily
    rotate 7
    missingok
    notifempty
    compress
    delaycompress
    postrotate
        systemctl reload myapp > /dev/null 2>&1 || true
    endscript
}
```

2. **Journal size.** If a service spews too much to the journal, cap it with `journalctl --vacuum-size=1G` or set `SystemMaxUse` in `/etc/journald.conf`.

The automation angle: treat `logrotate.d` files the same way as unit files — managed from source control, deployed as files, and reloaded after any change. That keeps disk policy and service policy in one repo.

## Verify

- `systemctl is-active myapp` returns `active`.
- `systemctl status myapp --no-pager -l` shows the loaded unit path and recent log lines.
- `journalctl -u myapp -f` streams live logs.
- `logrotate -d /etc/logrotate.d/myapp` (debug/dry dry-run) previews what rotation will do.

## What I'd try next

The natural next step is wiring these patterns into a CI/CD pipeline — a playbook that rolls out a service, verifies its health from the journal, and only then promotes the deploy. That moves "Linux configures it" into "Linux configures it and the pipeline trusts it."