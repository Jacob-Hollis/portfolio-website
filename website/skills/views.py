from django.shortcuts import render

# Create your views here.
def skills_index(request):
    return render(request, 'skills_index.html', {})
