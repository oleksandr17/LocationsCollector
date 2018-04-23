from django.db import models
import uuid
from django.utils import timezone


class Sender(models.Model):
    uuid = models.UUIDField(default=uuid.uuid4, unique=True)

    def __str__(self):
        return "UUID = {}".format(self.uuid)

class Location(models.Model):
    sender = models.ForeignKey(Sender, on_delete=models.CASCADE)
    lat = models.FloatField()
    lng = models.FloatField()
    timestamp = models.DateTimeField(default=timezone.now)

    def __str__(self):
        return "lat = {}, lng = {}, timestamp = {}".format(self.lat, self.lng, self.timestamp)