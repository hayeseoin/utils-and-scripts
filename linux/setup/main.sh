#!/bin/bash

set -e

cd "$(dirname "$0")"
cd ..

# $SCRIPTS_FIND=""
# $SCRIPTS=""

SCRIPTS=$(
    find . -mindepth 1 -maxdepth 1 -type d -exec basename {} \; | \
    grep -v "setup"
)

# echo $SCRIPTS

for i in $SCRIPTS; do
    echo $i
done