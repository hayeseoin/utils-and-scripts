#!/bin/bash

ARGS_EXIST=0
VALID_ARGS_ONE=(l u d s)
OPTIONS_EXIST=0
VALID_ARGS_TWO=(n)
LEN_SPEC_EXISTS=0

if [ $# -ne 0 ]; then
    ARGS_EXIST=1
fi

if [ $ARGS_EXIST -eq 1 ]; then
    echo "Options provided"
else
    echo "args not provided"
fi

for i in ${VALID_ARGS_ONE[@]}; do
    echo $i
done

for (( i=0; i<${#1}; i++ )); do
    echo "${1:$i:1}"
done

