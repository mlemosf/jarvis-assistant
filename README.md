# Jarvis

Jarvis is a personal voice assistant built on open source software. It runs everything on the host machine and is intended for people looking to run a GPT-like assistant on their own infrastructure.  
Jarvis uses OpenAI's [Whisper](https://github.com/openai/whisper) for speech-to-text transcription and [llama.cpp](https://github.com/ggerganov/llama.cpp) (with the OpenLLaMa 3b model) as a Large Language Model, focused on user interaction. OpenLLaMa is an openly licensed reproduction of Meta's original LlaMa model.  


## Dependencies

The project uses the folowing projects as dependencies:

- arecord (voice recording);
- Python >= 3.9
- virtualenv
- [whisper](https://github.com/openai/whisper) (speech-to-text);
- [llama.cpp](https://github.com/ggerganov/llama.cpp) (Text generation);

## Installation

1. Clone the repository:

``` shell
git clone https://github.com/mlemosf/jarvis-assistant
```

2. Enter the main folder:

```shell
cd jarvis-assistant
```

3. Create a virtual environment and activate it:

```shell
virtualenv venv
source venv/bin/activate
```

4. Clone the whisper repository:

```shell
git clone https://github.com/openai/whisper.git
```

5. Clone the llama.cpp repository and follow the installation procedures. We recommend using the [CUDA build](https://github.com/ggerganov/llama.cpp#cublas):

```shell
git clone https://github.com/ggerganov/llama.cpp
```

6. Run the setup script:

```shell
./setup.sh
```

7. Run the Jarvis script

```shell
./run.sh
```

## References

1. [OpenLLaMa](https://github.com/openlm-research/open_llama)


