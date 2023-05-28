from rest_framework.decorators import api_view, permission_classes
from rest_framework.response import Response
from rest_framework import status, viewsets
from django.core.files.storage import FileSystemStorage
import numpy as np
from rest_framework.permissions import IsAuthenticated
from django.core.files.storage import default_storage
from django.conf import settings
import uuid
import io
from dateutil.relativedelta import relativedelta
from django.utils import timezone
import moviepy.editor as moviepy
import platform

from user.models import Patient
from .models import Message
from .serializers import FileSerializer, DataSerializer, DataExtendedSerializer, MessageSerializer, PredictionSerializer, PredictionTextSerializer
from .predict import get_prediction


@api_view(['POST'])
# @permission_classes([IsAuthenticated])
def getPrediction(request):
    if request.method == 'POST':
        try:
            serializer = FileSerializer(data=request.data)

            if serializer.is_valid():

                file = request.FILES['file']

                file_format = file.name.split(".")[-1]

                fileName = default_storage.save(
                    str(uuid.uuid1())+"."+file_format, file)
                file = default_storage.open(fileName)
                file_url = default_storage.url(fileName)

                if platform.system() == 'Windows':
                    file_url = str(settings.BASE_DIR) + \
                        file_url.replace('/', '\\')
                else:
                    file_url = str(settings.BASE_DIR) + file_url

                if file_format != 'wav':
                    # clip = moviepy.VideoFileClip(file_url)
                    # clip.audio.write_audiofile(file_url.split(".")[0]+".wav")
                    return Response({"Error": "Unsupported Format"}, status=status.HTTP_400_BAD_REQUEST)

                res = get_prediction(file_url)

                serializer = PredictionTextSerializer(res, read_only=True)

                return Response(serializer.data, status=status.HTTP_200_OK)

            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

        except Exception as e:
            print(e)
            return Response({"Error": "something wrong"}, status=500)
