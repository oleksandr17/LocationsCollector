import logging

from rest_framework import status
from rest_framework.response import Response
from rest_framework.views import APIView

logger = logging.getLogger(__name__)

class Ping(APIView):

    def get(self, request, *args, **kwargs):
        logger.info(request._request)
        return Response({'success': True}, status=status.HTTP_200_OK)
