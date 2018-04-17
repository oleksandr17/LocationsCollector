from rest_framework import serializers
from . import models

class PostLocationSerializer(serializers.Serializer):
    user_uuid = serializers.UUIDField()
    lat = serializers.FloatField()
    lng = serializers.FloatField()

    def create(self, validated_data):
        # User
        try:
            user = models.User.objects.get(uuid=validated_data['user_uuid'])
        except models.User.DoesNotExist:
            user = models.User.objects.create(uuid=validated_data['user_uuid'])

        # Location
        location = models.Location.objects.create(user = user, lat=validated_data['lat'], lng=validated_data['lng'])

        return location