# Utilities and scripts

A collection of personal utilities for WSL, Linux and Windows.

## Linux

### Setup

Running the setup script should deploy these scripts to `~/.utils-and-scripts`. 
```sh
./linux/setup/main.sh
```
Aliases are added to `~/.profile.d`
> Important: ALiases are stored as seperate files in `~/.profile.d`, so it's importantt that the shell checks this directory. This can be done by adding the following to `~/.bashrc`
> ```sh
> if [ -d "$HOME/.profile.d" ]; then
>  for file in "$HOME/.profile.d"/*.sh; do
>    [ -r "$file" ] && [ -f "$file" ] && . "$file"
>  done
> fi
> ```

### Scripts

#### **`bash-random-generator`**
Uses bash to generate a random string. Currently set to generate a 14 character lower case string, useful for S3 buckets for example. 

Alias: `grand`

#### **`aws-profile-selector`**
Interactively choose from your configured AWS profiles, and set choice as `AWS_PROFILE` in the current shell.

Alias: `asp`

## WSL

### **`launch-ps-admin-shell.sh`**
Lauches a Powershell Admin window on the desktop at the current WSL directory. Useful for popping into powershell for a quick admin task from WSL. e.g. running 'vagrant up'. Most useful when working in the windows filesystem from WSL.

> Location: `/opt/utils-and-scripts/wsl/launch-ps-admin-shell.sh`  
> Alias: `alias psadmin=/opt/utils-and-scripts/wsl/launch-ps-admin-shell.sh`  
