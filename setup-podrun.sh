#!/bin/bash

# System dependencies
apt -y update
apt -y upgrade
apt -y install libgl1-mesa-glx pipx

# Python env
pipx install uv
export PATH="/root/.local/bin:$PATH"
uv init comfyui
cd comfyui
uv venv
uv pip install pip

# ComfyUI
git clone https://github.com/comfyanonymous/ComfyUI.git temp
mv temp/* .
rm -rdf temp
uv pip install -r requirements.txt

# ComfyUI Manager
git clone https://github.com/Comfy-Org/ComfyUI-Manager.git ./custom_nodes/ComfyUI-Manager

# Run ComfyUI
uv run main.py --listen 0.0.0.0 --port 8188 --cuda-device 0