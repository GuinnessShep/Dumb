#!/bin/bash
wget https://github.com/GuinnessShep/Dumb/raw/main/tunnelto
chmod +x tunnelto
tunnelto set-auth --key LPiLOhptMIl4Kbn6zgMw1u
python3 /app/download-model.py TheBloke/Tulu-30B-SuperHOT-8K-GPTQ --branch main
python3 /app/download-model.py TheBloke/WizardLM-33B-V1.0-Uncensored-GPTQ --branch main
python3 /app/download-model.py TheBloke/airoboros-65B-gpt4-1.4-GGML --branch main
python3 /app/download-model.py TheBloke/WizardLM-33B-V1.0-Uncensored-GGML --branch main
python3 /app/download-model.py TheBloke/chronos-33b-superhot-8k-fp16 --branch main
./tunnelto --subdomain ilovedogshit --port 7860 & python3 /app/server.py --chat --share --model LLaMA --auto-devices --extensions gallery send_pictures character_bias
wait
