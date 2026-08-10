#!/usr/bin/env bash
# last_verified: 2026-08-10 - bash n/a

# Shell scripting fundamentals exercises
# This script practices the basics I have been learning:
# variables, conditionals, loops, and functions.

echo "=== Shell Scripting Fundamentals ==="

# 1. Variables and user input
# I am using read to capture input instead of hardcoding values
read -rp "Enter your name: " username
echo "Hello, ${username}!"

# 2. Conditional checks
# Testing if a file exists before trying to read it
test_file="/etc/hostname"
if [ -f "$test_file" ]; then
    echo "The file $test_file exists."
else
    echo "The file $test_file is missing."
fi

# 3. Loops
# Looping through the current directory to count file types
echo "Counting files in the current directory..."
dir_count=0
file_count=0
for item in *; do
    if [ -d "$item" ]; then
        dir_count=$((dir_count + 1))
    elif [ -f "$item" ]; then
        file_count=$((file_count + 1))
    fi
done
echo "Directories: $dir_count, Files: $file_count"

# 4. Functions
# I wrapped the counting logic in a function so I can reuse it
count_items() {
    local target_dir="${1:-.}"
    echo "Scanning: $target_dir"
    # Using local variables so the function does not pollute the global scope
    local d=0
    local f=0
    for item in "$target_dir"/*; do
        [ -e "$item" ] || continue
        if [ -d "$item" ]; then
            d=$((d + 1))
        elif [ -f "$item" ]; then
            f=$((f + 1))
        fi
    done
    echo "Directories: $d, Files: $f"
}

# Calling the function with a different directory
count_items "/tmp"
