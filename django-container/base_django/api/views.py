from django.shortcuts import render
from django.http import HttpResponse, Http404, JsonResponse
from .models import Demo
from django.core import serializers


# Create your views here.
def index(request):
    return HttpResponse('Good morning, ' + request.GET.get('name', 'someone'))
