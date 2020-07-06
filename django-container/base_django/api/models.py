from django.db import models


# Create your models here.
class Demo (models.Model):
    topic = models.CharField(max_length=200)
    demo_type = models.CharField(max_length=200)
    content = models.CharField(max_length=200)
    image = models.CharField(max_length=200)
    url = models.CharField(max_length=200)
    date = models.DateTimeField()
