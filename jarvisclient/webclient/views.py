from django.shortcuts import render
from django.views.generic import TemplateView
from django.views.decorators.csrf import csrf_exempt
from django.http import HttpResponseRedirect, JsonResponse

# Create your views here.

class VoiceRecordingView(TemplateView):
    template_name = "webclient/recorder.html"

    def get(self, request, *args, **kwargs):
        return render(request, self.template_name, {})

    def post(self, request, *args, **kwargs):
        print(request.FILES)
        return JsonResponse({
            "message": "testmessage"
        })

class ResponseView(TemplateView):
    template_name = "webclient/response.html"

