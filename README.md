# Utilities and scripts

A collection of personal utilities for WSL, Linux and Windows.

## Linux

### `bash-random-generator`
Uses bash to generate a random string. Currently set to generate a 14 character lower case string, useful for S3 buckets for example. 

Location: `/opt/utils-and-scripts/linux/bash-random-generator/main.sh`
Alias: `alias grand=/opt/utils-and-scripts/linux/bash-random-generator/main.sh`

### `aws-profile-selector`
Interactively choose from your configured AWS profiles, and set choice as `AWS_PROFILE` in the current shell.

Location: `/opt/utils-and-scripts/linux/aws-profile-selector/main.sh`
Alias: `alias awssp="source /opt/utils-and-scripts/linux/aws-profile-selector/main.sh"`

## WSL

### `wsl/launch-ps-admin-shell.sh`
Lauches a Powershell Admin window on the desktop at the current WSL directory. Useful for popping into powershell for a quick admin task from WSL. e.g. running 'vagrant up'. Most useful when working in the windows filesystem from WSL.

**Recommended config:**

Location: `/opt/utils-and-scripts/wsl/launch-ps-admin-shell.sh`  
Alias: `alias psadmin=/opt/utils-and-scripts/wsl/launch-ps-admin-shell.sh`  
