from django.shortcuts import render
from django.views.generic import TemplateView

# Create your views here.

class VoiceRecordingView(TemplateView):
    template_name = "webclient/recorder.html"

