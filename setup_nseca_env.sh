#!/bin/bash

echo "🚀 Starting NSECA full environment setup..."

# 1. Install Python 3.10 and system dependencies
sudo apt update && sudo apt install -y software-properties-common
sudo add-apt-repository -y ppa:deadsnakes/ppa
sudo apt update
sudo apt install -y python3.10 python3.10-venv python3.10-dev build-essential ffmpeg libsm6 libxext6 git wget curl unzip

# 2. Create and activate virtual environment
python3.10 -m venv ~/nseca-venv310
source ~/nseca-venv310/bin/activate

# 3. Upgrade pip
pip install --upgrade pip

# 4. Download requirements.txt from GitHub
wget https://raw.githubusercontent.com/RajeshGit001/nseca-gpu-setup/main/requirements-nseca.txt -O /tmp/requirements-nseca.txt

# 5. Install all project dependencies
pip install -r /tmp/requirements-nseca.txt

# 6. Validate GPU PaddlePaddle installation
python3 -c "import paddle; print('✅ CUDA Enabled:', paddle.is_compiled_with_cuda(), '| GPU Count:', paddle.device.cuda.device_count())"

echo "✅ NSECA GPU environment setup completed successfully."
