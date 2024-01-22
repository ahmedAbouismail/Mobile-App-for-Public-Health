from django.shortcuts import render
from .genome_comparison import *
from django.http import JsonResponse


def get_variations(request):
    data = run_comparison()
    return JsonResponse(data, safe=False)