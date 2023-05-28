from rest_framework import serializers

from .models import Doctor, Hospital, Patient, User, Admin


class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = '__all__'


class AdminSerializer(serializers.ModelSerializer):
    user = UserSerializer()

    class Meta:
        model = Admin
        fields = '__all__'


class HospitalSerializer(serializers.ModelSerializer):
    user = UserSerializer()

    class Meta:
        model = Hospital
        fields = '__all__'


class DoctorSerializer(serializers.ModelSerializer):
    user = UserSerializer()
    hospital = HospitalSerializer()

    class Meta:
        model = Doctor
        fields = '__all__'


class PatientSerializer(serializers.ModelSerializer):
    user = UserSerializer()
    hospital = HospitalSerializer()
    doctor = DoctorSerializer()

    class Meta:
        model = Patient
        fields = '__all__'


class RegisterSerializer(serializers.Serializer):
    username = serializers.EmailField()
    password = serializers.CharField(max_length=200)
    name = serializers.CharField(max_length=100)
    contact_number = serializers.CharField(max_length=20)
    nic = serializers.CharField(max_length=20)
    address = serializers.CharField(max_length=200)
    dob = serializers.DateTimeField()
    hospital_id = serializers.CharField(max_length=20)


class DoctorRegisterSerializer(serializers.Serializer):
    username = serializers.EmailField()
    password = serializers.CharField(max_length=200)
    name = serializers.CharField(max_length=100)
    contact_number = serializers.CharField(max_length=20)
    nic = serializers.CharField(max_length=20)
    registration_number = serializers.CharField(max_length=20)
    hospital_id = serializers.CharField(max_length=20)


class HospitalRegisterSerializer(serializers.Serializer):
    username = serializers.EmailField()
    password = serializers.CharField(max_length=200)
    name = serializers.CharField(max_length=100)
    contact_number = serializers.CharField(max_length=20)
    location = serializers.CharField(max_length=20)


class LoginSerializer(serializers.Serializer):
    email = serializers.EmailField()
    password = serializers.CharField(max_length=200)
