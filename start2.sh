#/bin/bash/
wget https://github.com/agrinman/tunnelto/releases/download/0.1.18/tunnelto-linux.tar.gz
tar -xvzf tunnelto-linux.tar.gz
./tunnelto set-auth --key LPiLOhptMIl4Kbn6zgMw1u
./tunnelto --subdomain ilovedogshit --port 7860 & python3 /app/server.py --chat --share --model LLaMA --auto-devices --extensions gallery send_pictures character_bias
wait
