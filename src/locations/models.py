from django.db import models
import uuid


class User(models.Model):
    uuid = models.UUIDField(default=uuid.uuid4, unique=True)

class Location(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    lat = models.FloatField()
    lng = models.FloatField()