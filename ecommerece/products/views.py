from django.http import HttpResponse

def home(request):
    return HttpResponse("Hello, Django project is running!")