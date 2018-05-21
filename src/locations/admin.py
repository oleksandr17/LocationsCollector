from django.contrib import admin
from . import models

@admin.register(models.Sender)
class SenderAdmin(admin.ModelAdmin):
    pass

@admin.register(models.Location)
class LocationAdmin(admin.ModelAdmin):
    pass