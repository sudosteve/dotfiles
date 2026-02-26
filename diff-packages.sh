#!/bin/bash
# Compare installed packages against pacmanlist.txt and aurlist.txt

LISTFILE="${1:-pacmanlist.txt}"
AURLISTFILE="${2:-aurlist.txt}"
HWFILE="${3:-hardware_specific_packages.txt}"

if [[ ! -f "$LISTFILE" ]]; then
    echo "Error: $LISTFILE not found" >&2
    exit 1
fi

if [[ ! -f "$AURLISTFILE" ]]; then
    echo "Error: $AURLISTFILE not found" >&2
    exit 1
fi

if [[ -f "$HWFILE" ]]; then
    hw=$(sort "$HWFILE")
else
    hw=""
fi

# Native (non-AUR) packages
installed=$(comm -23 <(pacman -Qqen | sort) <(echo "$hw"))
listed=$(comm -23 <(sort "$LISTFILE") <(echo "$hw"))

comm -23 <(echo "$installed") <(echo "$listed") > new.txt
comm -13 <(echo "$installed") <(echo "$listed") > missing.txt

echo "=== Native packages ==="
echo "$(wc -l < new.txt) packages in new.txt (installed but not in list)"
echo "$(wc -l < missing.txt) packages in missing.txt (in list but not installed)"

# AUR packages
aur_installed=$(comm -23 <(pacman -Qqem | sort) <(echo "$hw"))
aur_listed=$(comm -23 <(sort "$AURLISTFILE") <(echo "$hw"))

comm -23 <(echo "$aur_installed") <(echo "$aur_listed") > aur_new.txt
comm -13 <(echo "$aur_installed") <(echo "$aur_listed") > aur_missing.txt

echo "=== AUR packages ==="
echo "$(wc -l < aur_new.txt) packages in aur_new.txt (installed but not in list)"
echo "$(wc -l < aur_missing.txt) packages in aur_missing.txt (in list but not installed)"
