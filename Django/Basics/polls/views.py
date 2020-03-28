from django.shortcuts import render
from django.http import HttpResponse
from django.http import JsonResponse


# Create your views here.

def index(request):
    return HttpResponse("Hello World !")


def results(request, admin_id):
    return HttpResponse("You are at the results of question %s " % admin_id)


def detail(request, admin_id):
    return HttpResponse("You are on the details page of question %s " % admin_id)


def vote(request, admin_id):
    return HttpResponse("You are voting on question %s" % admin_id)


def jsonadmin(request, admin_id):
    data = [{'name': 'Peter', 'tags': 'hotels,places', 'clients': 'Matt,Greg,Harry'},
            {'name': 'Julia', 'tags': 'hotels,places', 'clients': 'Lisa,Greg,Remi'},
            {'name': 'Julia', 'tags': 'hotels,places', 'clients': 'Lisa,Greg,Remi'},
            {'name': 'Julia', 'tags': 'hotels,places', 'clients': 'Lisa,Greg,Remi'},
            {'name': 'Julia', 'tags': 'hotels,places', 'clients': 'Lisa,Greg,Remi'},
            {'name': 'Julia', 'tags': 'hotels,places', 'clients': 'Lisa,Greg,Remi'},
            ]

    return JsonResponse(data, safe=False)
