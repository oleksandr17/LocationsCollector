
import logging

from rest_framework import serializers

from . import models

logger = logging.getLogger(__name__)


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
            logger.info("Create new sender: {}".format(sender))

        # Location
        location = models.Location.objects.create(sender=sender, lat=validated_data['lat'], lng=validated_data['lng'])
        logger.info("Create new location: {}".format(location))
        return location

class LocationSerializer(serializers.Serializer):

    def to_representation(self, obj):
        return "lat="+str(obj.lat)+", lng="+str(obj.lng)
