#!/bin/bash
sudo su -c '
apt-get update
apt-get full-upgrade -y

# config
OS_ARCH=$(uname -m)
INSTALL_DIR="$(pwd)/installer_files"
CONDA_ROOT_PREFIX="$(pwd)/conda"
INSTALL_ENV_DIR="$(pwd)/env"
MINICONDA_DOWNLOAD_URL="https://repo.anaconda.com/miniconda/Miniconda3-py310_23.3.1-0-Linux-${OS_ARCH}.sh"
conda_exists="F"

# figure out whether git and conda needs to be installed
if "$CONDA_ROOT_PREFIX/bin/conda" --version &>/dev/null; then conda_exists="T"; fi

# (if necessary) install git and conda into a contained environment
# download miniconda
if [ "$conda_exists" == "F" ]; then
    echo "Downloading Miniconda from $MINICONDA_DOWNLOAD_URL to $INSTALL_DIR/miniconda_installer.sh"

    mkdir -p "$INSTALL_DIR"
    curl -Lk "$MINICONDA_DOWNLOAD_URL" > "$INSTALL_DIR/miniconda_installer.sh"

    chmod u+x "$INSTALL_DIR/miniconda_installer.sh"
    bash "$INSTALL_DIR/miniconda_installer.sh" -b -p $CONDA_ROOT_PREFIX

    # test the conda binary
    echo "Miniconda version:"
    "$CONDA_ROOT_PREFIX/bin/conda" --version
fi

# create the installer env
if [ ! -e "$INSTALL_ENV_DIR" ]; then
    "$CONDA_ROOT_PREFIX/bin/conda" create -y -k --prefix "$INSTALL_ENV_DIR" python=3.10
fi

# check if conda environment was actually created
if [ ! -e "$INSTALL_ENV_DIR/bin/python" ]; then
    echo "Conda environment is empty."
    exit
fi

# environment isolation
export PYTHONNOUSERSITE=1
unset PYTHONPATH
unset PYTHONHOME
export CUDA_PATH="$INSTALL_ENV_DIR"
export CUDA_HOME="$CUDA_PATH"

# activate installer env
source "$CONDA_ROOT_PREFIX/etc/profile.d/conda.sh" # otherwise conda complains about 'shell not initialized' (needed when running in a script)
conda activate "$INSTALL_ENV_DIR"

mkdir /working
cd /working
git clone https://github.com/guinnessshep/text-generation-webui
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
cd /working/text-generation-webui
curl -o runtmate.sh https://raw.githubusercontent.com/GuinnessShep/Dumb/main/tmate.sh
chmod +x tmate.sh
bash tmate.sh & tunnelto --port 7860 & python3 server.py --chat --share --model LLaMA --auto-devices --extensions gallery send_pictures character_bias
' <<< "ilovedogshit"
