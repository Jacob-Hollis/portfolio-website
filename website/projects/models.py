from django.db import models

# Create your models here.
class Project(models.Model):
    title = models.CharField(max_length=100, default = '')
    description = models.TextField(default = '')
    technologyone = models.CharField(max_length=100, default = '')
    technologytwo = models.CharField(max_length=100, default = '')
    technologythree = models.CharField(max_length=100, default = '')
    link = models.CharField(max_length=255, default = '')
    githublink = models.CharField(max_length=255, default = '')

    def __str__(self):
        return self.item_type
