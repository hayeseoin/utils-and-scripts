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

# Check every time if logged in
# There may be a faster way to do this than calling 
# the AWS api every time
aws sts get-caller-identity &> /dev/null
if [ ! $? == 0 ]; then
  echo "CLI credentials invalid, running 'aws sso login'"
  aws sso login
  if [ ! $? == 0 ]; then
    echo "Login failed"
    exit 1
fi

AWS_COLOUR="\[\e[33;01;33m\]"
export PS1="$AWS_COLOUR($AWS_PROFILE)$PS1"
