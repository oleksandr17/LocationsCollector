from django.db import models
import uuid
from django.utils import timezone


class Sender(models.Model):
    uuid = models.UUIDField(default=uuid.uuid4, unique=True)

class Location(models.Model):
    sender = models.ForeignKey(Sender, on_delete=models.CASCADE)
    lat = models.FloatField()
    lng = models.FloatField()
    timestamp = models.DateTimeField(default=timezone.now)