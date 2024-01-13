#!/bin/bash
# Executes the Jarvis assistant

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

echo "[INFO] Recording audio..." 
arecord --format=cd ${AUDIOFILE} -d 10
echo "[INFO] Recorded ${AUDIOFILE}.wav audio file!"

echo "[INFO] Transcribing audio and generating answer..."

# Runs whisper
echo "[INFO] Converting speech to text..."
whisper ${AUDIOFILE} \
		--language $LANGUAGE \
		--model ${WHISPER_MODEL} \
		--output_format txt

# Runs OpenLLaMa on the generated file
echo "[INFO] Running OpenLLaMa..."
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

# Deletes files
printf "\n[INFO] Removing temp files..."
rm ${AUDIOFILE}
rm ${OUTPUTFILE}

exit 0
