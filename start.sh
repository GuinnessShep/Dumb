#!/bin/bash

# Set the authentication key
tunnelto set-auth --key GeBoAW1CSmWK5SbfOXUmU8

# Run the tunnelto command with the desired parameters
tunnelto --subdomain ilovedogshit --port 7860 &

# Run the Python script in the background
python3 /app/server.py --chat --share --model LLaMA --auto-devices --extensions gallery send_pictures character_bias &

# Wait for both processes to finish
wait
