# 🚀 NSECA Full GPU VM Setup Guide

**Generated on:** 2025-07-10 04:16:33  
**Maintainer:** Rajesh Kumar Ghosh  
**Project:** [nseca-gpu-setup](https://github.com/RajeshGit001/nseca-gpu-setup)

---

## 📁 Repository Structure

Your GitHub repository should include the following:

```bash
nseca-gpu-setup/
├── README.md
├── requirements-nseca.txt
└── setup_nseca_env.sh
```

---

## ⚙️ Step-by-Step Instructions to Set Up a New VM

Follow these steps **exactly in order** on any new cloud VM (Azure, AWS, GCP, E2E, Vast.ai, etc.):

### ✅ Step 1: Clone Your Repository

```bash
git clone https://github.com/RajeshGit001/nseca-gpu-setup.git
cd nseca-gpu-setup
```

---

### ✅ Step 2: Make the Setup Script Executable

```bash
chmod +x setup_nseca_env.sh
```

---

### ✅ Step 3: Run the Automated Setup

```bash
./setup_nseca_env.sh
```

This script will:
- Install Python 3.10 and system dependencies
- Create a virtual environment `nseca-venv310`
- Download the frozen `requirements-nseca.txt` from GitHub
- Install all project packages (including PaddleOCR, CUDA, Whisper, OCR engines)
- Run a quick CUDA check using `paddlepaddle-gpu`

---

## 📌 Script Breakdown (`setup_nseca_env.sh`)

```bash
# 1. System Prep
sudo apt update && sudo apt install -y software-properties-common
sudo add-apt-repository -y ppa:deadsnakes/ppa
sudo apt update
sudo apt install -y python3.10 python3.10-venv python3.10-dev build-essential ffmpeg ...

# 2. Create venv
python3.10 -m venv ~/nseca-venv310
source ~/nseca-venv310/bin/activate

# 3. Upgrade pip
pip install --upgrade pip

# 4. Download requirements
wget https://raw.githubusercontent.com/RajeshGit001/nseca-gpu-setup/main/requirements-nseca.txt -O /tmp/requirements-nseca.txt

# 5. Install dependencies
pip install -r /tmp/requirements-nseca.txt

# 6. Validate CUDA
python3 -c "import paddle; print('✅ CUDA Enabled:', paddle.is_compiled_with_cuda(), '| GPU Count:', paddle.device.cuda.device_count())"
```

---

## 🧪 Optional Test

Create a file called `test_paddleocr_gpu.py` and paste the following:

```python
from paddleocr import PaddleOCR
ocr = PaddleOCR(use_angle_cls=True, lang='en', use_gpu=True)
ocr.ocr('sample_invoice.png')
```

---

## 💾 Backup & Reuse Tips

- Always keep `requirements-nseca.txt` in sync via `pip freeze > requirements-nseca.txt`
- Upload model weights & audio samples externally (don’t overload GitHub)
- Re-run `setup_nseca_env.sh` after VM migration or re-creation
- Keep this `.md` file in a safe place or pen drive for offline reference

---

## 🎉 Done!

Your GPU-powered document & audio processing environment is now ready.
