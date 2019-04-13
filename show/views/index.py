from django.shortcuts import HttpResponse,redirect,render
from django.http import JsonResponse




def index(request):
    return render(request,"index.html")




