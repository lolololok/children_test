from django.shortcuts import HttpResponse


def manager_page(request):
    return HttpResponse("M")