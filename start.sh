#!/bin/bash
apt-get update
apt-get full-upgrade -y
mkdir /working
cd /working
git clone https://github.com/oobabooga/text-generation-webui
cd text-generation-webui
pip install -r requirements.txt
pip install -U gradio==3.28.3
wget https://github.com/agrinman/tunnelto/releases/download/0.1.18/tunnelto-linux.tar.gz
tar -xvzf tunnelto-linux.tar.gz
cp tunnelto /usr/local/bin/
chmod +x /usr/local/bin/tunnelto
source ~/.bashrc
./tunnelto set-auth --key LPiLOhptMIl4Kbn6zgMw1u
mkdir repositories
cd repositories
git clone https://github.com/qwopqwop200/GPTQ-for-LLaMa
cd GPTQ-for-LLaMa
pip install torch torchvision torchaudio
pip install -r requirements.txt
pip install auto-gptq
cd ..
git clone https://github.com/PanQiWei/AutoGPTQ.git
cd AutoGPTQ
pip install .
cd ..
cd ..
pip install markdown
python3 download-model.py TheBloke/chronos-33b-superhot-8k-fp16
cd /working/text-generation-webui && tunnelto --port 7860 & python3 server.py --chat --share --model LLaMA --auto-devices --extensions gallery send_pictures character_bias
