from django.shortcuts import render
from django.http import HttpResponse, Http404, JsonResponse
from .models import Demo
from django.core import serializers


# Create your views here.
def index(request):
    return HttpResponse('Good morning, ' + request.GET.get('name', 'someone'))


def demoApi(request):
    if request.method != 'GET':
        raise Http404("Wrong http method")

    if request.GET.get('demo_type', None):
        demos = Demo.objects.filter(categories__exact=request.GET['demo_type']).values()
    else:
        demos = Demo.objects.all().values()
    return JsonResponse({'data': list(demos)})
