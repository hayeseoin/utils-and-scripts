#!/bin/bash

AWS_PROFILE=""
INPUT_ARG=$1

check_args_for_profile() {
  for i in "${aws_profiles[@]}"; do
    if [[ $INPUT_ARG == $i ]]; then
      export AWS_PROFILE=$i
      return 0
    fi
  done
  return 1
}

select_profile_from_list() {

  for i in "${!aws_profiles[@]}"; do
    index=$((i + 1))
    printf "  [$((i+1))] ${aws_profiles[$i]}\n"
  done
    printf "  [0] exit\n"

  read -rp "Select profile [1-${#aws_profiles[@]}]: " choice

  if [[ "$choice" == 0 || "$choice" == "exit" ]]; then
    source $HOME/.bashrc
    return 99
  fi

  if [[ ! "$choice" =~ ^[0-9]+$ ]] || (( choice < 1 || choice > ${#aws_profiles[@]} )); then
    echo "Invalid choice."
    return 1
  fi

  export AWS_PROFILE="${aws_profiles[choice-1]}"
}

aws_load_profiles() {
  mapfile -t aws_profiles < <(aws configure list-profiles | grep -v 'default')
}

if [[ ! -f "$HOME/.bashrc" ]]; then
  echo "No .bashrc file detected"
  return 1
fi

if [[ $INPUT_ARG == 'exit' ]]; then
  AWS_PROFILE=""
  source $HOME/.bashrc
  return 0
fi

aws_load_profiles

if [[ $INPUT_ARG ]]; then
  check_args_for_profile
  if [[ $? -eq 1 ]]; then
    echo "$INPUT_ARG is not a configured profile"
    return 1
  fi
fi

if [[ $INPUT_ARG && ! $AWS_PROFILE ]]; then
  echo "$INPUT_ARG is not a configured profile"
  return 1
fi

if [[ ! $AWS_PROFILE ]]; then
  select_profile_from_list
  if [[ $? -eq 99 ]]; then
    return 0
  elif [[ $? -eq 1 ]]; then
    return 1
  fi
fi

aws sts get-caller-identity &> /dev/null
if [ ! $? == 0 ]; then
  echo "CLI credentials invalid, running 'aws sso login'"
  aws sso login
  if [ ! $? == 0 ]; then
    echo "Login failed"
    AWS_PROFILE=""
    return 1
  fi
fi

AWS_COLOUR="\[\e[33;01;33m\]"
source $HOME/.bashrc
export PS1="$AWS_COLOUR(${AWS_PROFILE})$PS1"