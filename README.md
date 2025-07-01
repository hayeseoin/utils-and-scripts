# Utilities and scripts

A collection of personal utilities for WSL, Linux and Windows.

## Linux

### Setup

Running the setup script should deploy these scripts to `~/.utils-and-scripts/linux`. 
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

#### [**`bash-random-generator`**](/linux/bash-random-generator/)
Uses bash to generate a random string. Currently set to generate a 14 character lower case string, useful for S3 buckets for example. 

**Alias**: `grand`

**Usage examples**:
```sh
# Generate random 14 letter string
$ grand
odkjiepozxowjf
```

#### [**`aws-profile-selector`**](/linux/aws-profile-selector/)
Choose from your configured AWS profiles, and set choice as `AWS_PROFILE` in the current shell. Interactively or with parameters.

**Alias**: `asp`

**Instructions**:  
 - `asp` loads the interactive mentu
 - `asp [PROFILE]` loads a known profile directly
 - `asp exit` unloads the profile

**Usage examples**:
```sh
# Basic interactive
[host]:[~]
$ asp
  [1] eoins_profile
  [2] sa-main-eoinhay-es
  [3] sa-test-eoinhay-es
  [0] exit
Select profile [1-3]: 1
(eoins_profile)[host]:[~]

# Inline
[host]:[~]
$ asp eoins_profile
(eoins_profile)[host]:[~]

# Exiting
(eoins_profile)[host]:[~]
$ asp exit
[host]:[~]
```


## WSL

### Setup

Running the setup script should deploy these scripts to `~/.utils-and-scripts/wsl`. 
```sh
./wsl/setup/main.sh
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

#### [**`launch-ps-admin-shell.sh`**](/wsl/ps-admin-shell/)
Lauches a Powershell Admin window on the desktop at the current WSL directory. Useful for popping into powershell for a quick admin task from WSL. e.g. running any Hyper-V powershell commands.

**Alias**: `psadmin`

**Usage**
Run the script in a bash shell
```sh
# Bash shell
psadmin
```
A windows admin pop up will appear. If approved, a seperate powershell admin window will appear on your desktop.

