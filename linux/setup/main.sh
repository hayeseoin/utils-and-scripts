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

for i in $SCRIPTS; do
    chmod -R 644 "$i/profile.d"
    ln "$i/profile.d/*.sh" $HOME/.profile.d/
done