from rest_framework import serializers
from .models import Message
from user.serializers import PatientSerializer


class FileSerializer(serializers.Serializer):
    file = serializers.FileField()


class DataSerializer(serializers.Serializer):
    answer_1 = serializers.IntegerField()
    answer_2 = serializers.IntegerField()
    answer_3 = serializers.IntegerField()
    answer_4 = serializers.IntegerField()
    answer_5 = serializers.IntegerField()
    answer_6 = serializers.IntegerField()
    answer_7 = serializers.IntegerField()
    answer_8 = serializers.IntegerField()
    answer_9 = serializers.IntegerField()
    answer_10 = serializers.IntegerField()
    answer_11 = serializers.IntegerField()
    answer_12 = serializers.IntegerField()
    answer_13 = serializers.IntegerField()
    answer_14 = serializers.IntegerField()
    answer_15 = serializers.IntegerField()
    answer_16 = serializers.IntegerField()


class DataExtendedSerializer(serializers.Serializer):
    answer_1 = serializers.IntegerField()
    answer_2 = serializers.IntegerField()
    answer_3 = serializers.IntegerField()
    answer_4 = serializers.IntegerField()
    answer_5 = serializers.IntegerField()
    answer_6 = serializers.IntegerField()
    answer_7 = serializers.IntegerField()
    answer_8 = serializers.IntegerField()
    answer_9 = serializers.IntegerField()
    answer_10 = serializers.IntegerField()
    answer_11 = serializers.IntegerField()
    answer_12 = serializers.IntegerField()
    answer_13 = serializers.IntegerField()
    answer_14 = serializers.IntegerField()
    answer_15 = serializers.IntegerField()
    answer_16 = serializers.IntegerField()
    answer_17 = serializers.IntegerField()
    answer_18 = serializers.IntegerField()
    answer_19 = serializers.IntegerField()
    answer_20 = serializers.IntegerField()


class PredictionSerializer(serializers.Serializer):
    status = serializers.IntegerField()
    prediction = serializers.IntegerField()


class PredictionTextSerializer(serializers.Serializer):
    status = serializers.IntegerField()
    prediction = serializers.CharField()


class MessageSerializer(serializers.ModelSerializer):
    patient = PatientSerializer()

    class Meta:
        model = Message
        fields = '__all__'
