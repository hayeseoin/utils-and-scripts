# Utilities and scripts

A collection of personal utilities for WSL, Linux and Windows.

## Linux

> Important: ALiases are stored as seperate files in `~/.profile.d`, so it's importantt that the shell checks this directory. This can be done by adding the following to `~/.bashrc`
> ```sh
> if [ -d "$HOME/.profile.d" ]; then
>  for file in "$HOME/.profile.d"/*.sh; do
>    [ -r "$file" ] && [ -f "$file" ] && . "$file"
>  done
> fi
> ```

### Setup

To enable these scripts for all users, we can place the scripts in the `/opt` directory, and add the shell aliases to `/etc/profile.d`. This requires extra steps, as we will need to create a management group for the directory and update the permissions to make it easier to keep up to date.

#### 1. Clone repo
```sh
cd /opt
sudo git clone git@github.com:hayeseoin/utils-and-scripts.git
```

#### 2. Create `script-admins` group
```sh
sudo groupadd script-admins
sudo usermod -aG script-admins $USER
```

#### 3. Update permissions
```sh
sudo chown -R root:script-admins utils-and-scripts/
udo chmod -R 775 utils-and-scripts/
```

#### 4. Configure aliases
Aliases are stored in- [`/linux/utils-and-scripts.sh`](./linux/utils-and-scripts.sh). These need to be added to `/etc/profile.d`.
```sh
sudo chmod 644 /opt/utils-and-scripts/linux/utils-and-scripts.sh
sudo ln /opt/utils-and-scripts/linux/utils-and-scripts.sh /etc/profile.d/
```

#### 5. Log out
Log out and in again to load aliases. Or, for a quick test:
```sh
bash --login
```

### Scripts

#### **`bash-random-generator`**
Uses bash to generate a random string. Currently set to generate a 14 character lower case string, useful for S3 buckets for example. 

> Location: `/opt/utils-and-scripts/linux/bash-random-generator/main.sh`**
> Alias: `alias grand=/opt/utils-and-scripts/linux/bash-random-generator/main.sh`**

#### **`aws-profile-selector`**
Interactively choose from your configured AWS profiles, and set choice as `AWS_PROFILE` in the current shell.

> Location: `/opt/utils-and-scripts/linux/aws-profile-selector/main.sh`
> Alias: `alias awssp="source /opt/utils-and-scripts/linux/aws-profile-selector/main.sh"`

## WSL

### **`launch-ps-admin-shell.sh`**
Lauches a Powershell Admin window on the desktop at the current WSL directory. Useful for popping into powershell for a quick admin task from WSL. e.g. running 'vagrant up'. Most useful when working in the windows filesystem from WSL.

> Location: `/opt/utils-and-scripts/wsl/launch-ps-admin-shell.sh`  
> Alias: `alias psadmin=/opt/utils-and-scripts/wsl/launch-ps-admin-shell.sh`  
