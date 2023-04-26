from django.db import models

# Create your models here.
class Project(models.Model):
    title = models.CharField(max_length=100)
    description = models.TextField(default = '')
    technologyone = models.CharField(max_length=100)
    technologytwo = models.CharField(max_length=100)
    technologythree = models.CharField(max_length=100)
    link = models.CharField(max_length=255)
    githublink = models.CharField(max_length=255)
