#!/bin/bash

set -e

BASH_PROFILES="$HOME/.profile.d"

cd "$(dirname "$0")"
cd ..

SCRIPTS=$(
    find . -mindepth 1 -maxdepth 1 -type d -exec basename {} \; | \
    grep -v "setup"
)

# Ensure ~/.profile.d exists
mkdir -p $BASH_PROFILES

# for i in $SCRIPTS; do
#     chmod 644 "$PWD/$i/profile.d/*.sh"
#     ln "$PWD/$i/profile.d/*.sh" $HOME/.profile.d/
# done

for i in $SCRIPTS; do
    for script in "$PWD/$i/profile.d/"*.sh; do
        [ -f "$script" ] || continue
        chmod 644 "$script"
        ln -sf "$script" "$HOME/.profile.d/"
    done
done