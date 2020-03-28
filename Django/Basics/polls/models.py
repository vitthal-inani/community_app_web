import datetime

from django.db import models
from django.utils import timezone


# Create your models here.
class Posts(models.Model):
    def __str__(self):
        return self.question_text

    def was_published_recently(self):
        return self.pub_date >= timezone.now() - datetime.timedelta(days=1)

    question_text = models.CharField(max_length=200)
    pub_date = models.DateTimeField('Date Published')


class Choice(models.Model):
    def __str__(self):
        return self.choice_text

    question = models.ForeignKey(Posts, on_delete=models.CASCADE)
    choice_text = models.CharField(max_length=200)
    votes = models.IntegerField(default=0)


class Client(models.Model):
    def __str__(self):
        return self.name

    name = models.CharField(max_length=40)
    area = models.TextField(max_length=40)
    service = models.IntegerField(default=0)


class Guide(models.Model):
    def __str__(self):
        return self.name

    name = models.CharField(max_length=40)
    tags = models.CharField(max_length=100)
    clients = models.ForeignKey(Client, on_delete=models.CASCADE)
    rating = models.IntegerField(default=0)
