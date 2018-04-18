from rest_framework import serializers
from . import models

class PostLocationSerializer(serializers.Serializer):
    sender_uuid = serializers.UUIDField()
    lat = serializers.FloatField()
    lng = serializers.FloatField()

    def create(self, validated_data):
        # User
        try:
            sender = models.Sender.objects.get(uuid=validated_data['sender_uuid'])
        except models.Sender.DoesNotExist:
            sender = models.Sender.objects.create(uuid=validated_data['sender_uuid'])

        # Location
        location = models.Location.objects.create(sender = sender, lat=validated_data['lat'], lng=validated_data['lng'])

        return location