from django.shortcuts import render

# Create your views here.
def contact_index(request):
    return render(request, 'contact_index.html', {})