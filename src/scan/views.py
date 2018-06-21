from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status

class Scan(APIView):

    def get(self, request, *args, **kwargs):
        return Response({'scan': 'stub'}, status=status.HTTP_200_OK)