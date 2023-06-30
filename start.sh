#!/bin/bash
wget https://github.com/GuinnessShep/Dumb/raw/main/tunnelto
chmod +x tunnelto
tunnelto set-auth --key LPiLOhptMIl4Kbn6zgMw1u
tunnelto --subdomain ilovedogshit --port 7860 & python3 /app/server.py --chat --share --model LLaMA --auto-devices --extensions gallery send_pictures character_bias
wait
