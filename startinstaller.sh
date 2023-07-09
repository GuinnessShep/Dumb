#!/bin/bash
apt-get update
apt-get -y full-upgrade
apt-get install wget build-essentials curl 
wget https://github.com/agrinman/tunnelto/releases/download/0.1.18/tunnelto-linux.tar.gz
tar -xvzf tunnelto-linux.tar.gz
cp tunnelto /usr/local/bin/
chmod +x /usr/local/bin/tunnelto
source ~/.bashrc
./tunnelto set-auth --key LPiLOhptMIl4Kbn6zgMw1u
git clone https://github.com/GuinnessShep/one-click-installers.git
cd one-click-installers
bash start_linux.sh & tunnelto --port 7860
