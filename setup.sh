#!/bin/bash
# Downloads and installs the pip dependencies for whisper and llama.cpp 
# Matheus Lemos <matheuslemosf@protonmail.com>

VENV_DIR=./venv

source $VENV_DIR/bin/activate

echo "[INFO] Installing dependencies"
pip install -r whisper/requirements.txt
pip install -r llama.cpp/requirements.txt

echo "[INFO] Done!"
