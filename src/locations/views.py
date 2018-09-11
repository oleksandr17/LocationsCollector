from django.views.generic.base import TemplateView
from rest_framework import status
from rest_framework.response import Response
from rest_framework.views import APIView

from . import models, serializers


class LocationListView(APIView):

    def get(self, request, *args, **kwargs):
        serializer = serializers.LocationSerializer(models.Location.objects.all(), many=True)
        return Response(serializer.data, status=status.HTTP_200_OK)

    def post(self, request, *args, **kwargs):
        serializer = serializers.PostLocationSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.validated_data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)



class LocationsMapView(TemplateView):
    template_name = 'locations/index.html'

    def get_context_data(self, **kwargs):
        return {'locations': models.Location.objects.all()}
