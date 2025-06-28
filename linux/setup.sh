#!/bin/bash

cd /opt
sudo git clone git@github.com:hayeseoin/utils-and-scripts.git
sudo groupadd script-admins
sudo usermod -aG script-admins $USER
sudo chown -R root:script-admins utils-and-scripts/
sudo chmod -R 775 utils-and-scripts/
sudo chmod 644 /opt/utils-and-scripts/linux/utils-and-scripts.sh
sudo ln /opt/utils-and-scripts/linux/utils-and-scripts.sh /etc/profile.d/