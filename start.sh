#!/bin/bash
mkdir /app/install
cd /app/install
wget https://github.com/GuinnessShep/Dumb/raw/main/tunnelto
chmod +x tunnelto
tunnelto set-auth --key LPiLOhptMIl4Kbn6zgMw1u
git clone -b v1.0 https://github.com/camenduru/text-generation-webui
cd text-generation-webui
pip install -r requirements.txt
pip install -U gradio==3.28.3
mkdir /content/text-generation-webui/repositories
cd /content/text-generation-webui/repositories
git clone -b v1.0 https://github.com/camenduru/GPTQ-for-LLaMa.git
cd GPTQ-for-LLaMa
python3 setup_cuda.py install
cd ..
git clone https://github.com/PanQiWei/AutoGPTQ.git
cd AutoGPTQ
pip install .
cd ..
cd ..
python3 download-model.py TheBloke/Tulu-30B-SuperHOT-8K-GPTQ --branch main
python3 download-model.py TheBloke/WizardLM-33B-V1.0-Uncensored-GPTQ --branch main
python3 download-model.py TheBloke/airoboros-65B-gpt4-1.4-GGML --branch main
python3 download-model.py TheBloke/WizardLM-33B-V1.0-Uncensored-GGML --branch main
python3 download-model.py TheBloke/chronos-33b-superhot-8k-fp16 --branch main
./tunnelto --subdomain ilovedogshit --port 7860 & python3 server.py --chat --share --model LLaMA --auto-devices --extensions gallery send_pictures character_bias
wait
