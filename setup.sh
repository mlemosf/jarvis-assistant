#!/bin/bash
# Instala as dependências do Whisper e do LLaMa.cpp 
# Matheus Lemos <matheuslemosf@protonmail.com>

VENV_DIR=./venv

source $VENV_DIR/bin/activate

echo "[INFO] Instalando dependências"
pip install -r whisper/requirements.txt
pip install -r llama.cpp/requirements.txt

echo "[INFO] Dependências instaladas!"
