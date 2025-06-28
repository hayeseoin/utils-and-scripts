#!/bin/bash

mapfile aws_profiles < <(aws configure list-profiles | grep -v 'default')

for i in "${!aws_profiles[@]}"; do
  index=$((i + 1))
  printf "  [$((i+1))] ${aws_profiles[$i]}"
done

read -rp "Select profile [1-${#aws_profiles[@]}]: " choice

if [[ ! "$choice" =~ ^[0-9]+$ ]] || (( choice < 1 || choice > ${#aws_profiles[@]} )); then
  echo "Invalid choice."
  exit 1
fi

export AWS_PROFILE=$(echo -n ${aws_profiles[choice-1]})