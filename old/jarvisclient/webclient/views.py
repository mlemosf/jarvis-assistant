from django.shortcuts import render
from django.views.generic import TemplateView
from django.views.decorators.csrf import csrf_exempt
from django.http import HttpResponseRedirect, JsonResponse
from django.core.files import File
from config.settings import JARVIS_ENDPOINT
import requests
from pydub import AudioSegment

# Create your views here.

class VoiceRecordingView(TemplateView):
    template_name = "webclient/recorder.html"

    def get(self, request, *args, **kwargs):
        return render(request, self.template_name, {})

    def post(self, request, *args, **kwargs):
        # Retira arquivos
        recorded_file = request.FILES['audio']
        file_content = recorded_file.file.read()
        content_type = recorded_file.content_type
        ogg_file_name = "./userinput.ogg"
        mp3_file_name = "./userinput.mp3"

        # Escreve arquivo effmpeg -i input.wav -vn -ar 44100 -ac 2 -b:a 192k output.mp3m formato mp3
        with open(ogg_file_name, "wb") as file:
            file.write(file_content)

        # Converte de ogg para mp3 e lê em sequência
        ogg_file = AudioSegment.from_ogg(ogg_file_name)
        mp3_file = ogg_file.export(mp3_file_name, format="mp3")
        with open(mp3_file_name, "rb") as file:
            final_file = file.read()

        # Chama API do Jarvis passando o arquivo
        files = {
            'file': ('message.mp3', final_file, 'audio/mpeg', {'Expires': '0'})
        }
        data = {}
        response = requests.post(JARVIS_ENDPOINT, files=files, data=data)
        response_text = response.json()

        # Retorna a resposta
        return JsonResponse(response_text)

class ResponseView(TemplateView):
    template_name = "webclient/response.html"

