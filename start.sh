#!/bin/bash
apt-get update
apt-get full-upgrade -y
mkdir /working
cd /working
git clone -b v1.0 https://github.com/camenduru/text-generation-webui
cd text-generation-webui
pip install -r requirements.txt
pip install -U gradio==3.28.3
wget https://github.com/agrinman/tunnelto/releases/download/0.1.18/tunnelto-linux.tar.gz
tar -xvzf tunnelto-linux.tar.gz
./tunnelto set-auth --key LPiLOhptMIl4Kbn6zgMw1u
mkdir repositories
cd repositories
git clone -b v1.0 https://github.com/camenduru/GPTQ-for-LLaMa.git
cd GPTQ-for-LLaMa
python3 setup_cuda.py install
cd ..
git clone https://github.com/PanQiWei/AutoGPTQ.git
cd AutoGPTQ
pip install .
cd ..
cd ..
pip install markdown
python3 download-model.py TheBloke/Tulu-30B-SuperHOT-8K-GPTQ
python3 download-model.py TheBloke/WizardLM-33B-V1.0-Uncensored-GPTQ
python3 download-model.py TheBloke/airoboros-65B-gpt4-1.4-GGML
python3 download-model.py TheBloke/WizardLM-33B-V1.0-Uncensored-GGML
python3 download-model.py TheBloke/chronos-33b-superhot-8k-fp16
./tunnelto --port 7860 & python3 server.py --chat --share --model LLaMA --auto-devices --extensions gallery send_pictures character_bias
wait
