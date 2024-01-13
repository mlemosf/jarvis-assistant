#!/bin/bash
# Executa a pipeline para geração de texto do Jarvis

# Script options
AUDIOFILE=jarvisinput.wav
OUTPUTFILE=jarvisinput.txt
LANGUAGE=pt

# Whisper options
WHISPER_MODEL=small

# LLaMa options
GPU_LAYERS=15
WORDS=50
MODEL=./llama.cpp/models/open_llama_3b_v2/ggml-model-f16.gguf
FLAGS=--log-disable
CTX_SIZE=512
TEMPERATURE=0.5
REPEAT_PENALTY=1.5

echo "[INFO] Gravando áudio..." 
arecord --format=cd ${AUDIOFILE} -d 10
echo "[INFO] Gerado arquivo ${AUDIOFILE}.wav."

echo "[INFO] Transcrevendo áudio e gerando resposta..."

# Executa o whisper
echo "[INFO] Executando conversão de voz para texto..."
whisper ${AUDIOFILE} \
		--language $LANGUAGE \
		--model ${WHISPER_MODEL} \
		--output_format txt

# Executa o llama com o arquivo gerado
echo "[INFO] Executando LLaMa..."
./llama.cpp/main \
	-m $MODEL \
	-f ${OUTPUTFILE} \
	-n $WORDS -e \
	-ngl $GPU_LAYERS \
	-c $CTX_SIZE \
	--temp $TEMPERATURE \
	--repeat-penalty $REPEAT_PENALTY \
	--color \
    $FLAGS

# Remove arquivos
printf "\n[INFO] Removendo arquivos temporários..."
rm ${AUDIOFILE}
rm ${OUTPUTFILE}

exit 0
