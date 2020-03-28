from django.contrib import admin

from .models import Posts
from .models import Client
from .models import Guide

# Register your models here.

admin.site.register(Posts)
admin.site.register(Guide)
admin.site.register(Client)