from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from . import serializers


class LocationList(APIView):

    def post(self, request, *args, **kwargs):
        serializer = serializers.PostLocationSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.validated_data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
