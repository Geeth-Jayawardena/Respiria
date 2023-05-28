from django.db import IntegrityError
from django.forms import ValidationError
from rest_framework.decorators import api_view, permission_classes
from rest_framework.authtoken.models import Token
from rest_framework.response import Response
from rest_framework import status, viewsets
from django.contrib.auth.hashers import make_password, check_password
from rest_framework.permissions import IsAuthenticated
from datetime import date
from .serializers import HospitalSerializer, DoctorSerializer, LoginSerializer, PatientSerializer, AdminSerializer, RegisterSerializer, DoctorRegisterSerializer, HospitalRegisterSerializer
from .models import User, Hospital, Doctor, Patient, Admin

typeList = [
    'HOSPITAL',
    'DOCTOR',
    'PATIENT',
]


@api_view(["POST"])
def register(request):
    try:
        type = request.data.get('type')

        if request.data.get('type') not in typeList:
            return Response({'error': ["'type' should be one of 'HOSPITAL', 'DOCTOR', or 'PATIENT'."]}, status=status.HTTP_400_BAD_REQUEST)

        if type == 'HOSPITAL':
            serializer = HospitalRegisterSerializer(data=request.data)
            if serializer.is_valid():
                user = User()
                user.username = request.data.get('username')
                user.password = make_password(request.data.get('password'))
                user.name = request.data.get('name')
                user.contact_number = request.data.get('contact_number')
                user.role = 'HOSPITAL'
                user.save()

                hospital = Hospital(
                    user=user, location=request.data.get('location'))
                hospital.save()

                token = Token.objects.create(user=user)

                return Response({
                    'user': serializer.data,
                    'token': token.key
                })

            else:
                return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

        elif type == 'DOCTOR':
            serializer = DoctorRegisterSerializer(data=request.data)
            if serializer.is_valid():
                hospital = Hospital.objects.filter(
                    id=request.data.get('hospital_id')).first()

                if not hospital:
                    return Response({'error': ['User not found']}, status=status.HTTP_400_BAD_REQUEST)

                user = User()
                user.username = request.data.get('username')
                user.password = make_password(request.data.get('password'))
                user.name = request.data.get('name')
                user.contact_number = request.data.get('contact_number')
                user.role = 'DOCTOR'
                user.save()

                doctor = Doctor(
                    user=user,
                    registration_number=request.data.get(
                        'registration_number'),
                    nic=request.data.get('nic'),
                    hospital=hospital,
                )
                doctor.save()

                token = Token.objects.create(user=user)

                return Response({
                    'user': serializer.data,
                    'token': token.key
                })

            else:
                return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

        elif type == 'PATIENT':
            serializer = RegisterSerializer(data=request.data)
            if serializer.is_valid():
                hospital = Hospital.objects.filter(
                    id=request.data.get('hospital_id')).first()

                if not hospital:
                    return Response({'error': ['User not found']}, status=status.HTTP_400_BAD_REQUEST)

                user = User()
                user.username = serializer.data.get('username')
                user.password = make_password(serializer.data.get('password'))
                user.name = serializer.data.get('name')
                user.contact_number = serializer.data.get('contact_number')
                user.role = 'PATIENT'
                user.save()

                patient = Patient(
                    user=user,
                    nic=serializer.data.get('nic'),
                    dob=serializer.data.get('dob'),
                    address=serializer.data.get('address'),
                    hospital=hospital,
                )

                patient.save()

                token = Token.objects.create(user=user)

                return Response({
                    'user': serializer.data,
                    'token': token.key
                })

            else:
                return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

        else:
            return Response({'error': ['Error creating user']}, status=status.HTTP_400_BAD_REQUEST)

    except Exception as e:
        print(e)
        return Response({"error": "Something went wrong", "error details": e}, status=500)
        

@api_view(["POST"])
def login(request):
    try:
        serializer = LoginSerializer(data=request.data)

        if serializer.is_valid():
            user = User.objects.filter(
                username=serializer.data.get('email')).first()

            if user is None:
                return Response({'error': ['User not found']}, status=status.HTTP_400_BAD_REQUEST)

            if not check_password(serializer.data.get('password'), user.password):
                return Response({'error': ['Incorrect Password']}, status=status.HTTP_400_BAD_REQUEST)

            type = user.role

            if type == 'HOSPITAL':
                hospital = Hospital.objects.filter(user=user).first()

                if not hospital:
                    return Response({'error': ['User not found']}, status=status.HTTP_400_BAD_REQUEST)

                serializer = HospitalSerializer(hospital)

                token = Token.objects.get_or_create(user=user)

                return Response({'user': serializer.data, 'token': token[0].key})

            elif type == 'DOCTOR':
                doctor = Doctor.objects.filter(user=user).first()

                if not doctor:
                    return Response({'error': ['User not found']}, status=status.HTTP_400_BAD_REQUEST)

                serializer = DoctorSerializer(doctor)

                token = Token.objects.get_or_create(user=user)

                return Response({'user': serializer.data, 'token': token[0].key})

            elif type == 'PATIENT':
                patient = Patient.objects.filter(user=user).first()

                if not patient:
                    return Response({'error': ['User not found']}, status=status.HTTP_400_BAD_REQUEST)

                serializer = PatientSerializer(patient)

                token = Token.objects.get_or_create(user=user)

                return Response({'user': serializer.data, 'token': token[0].key})

            elif type == 'ADMIN':
                admin = Admin.objects.filter(user=user).first()

                if not admin:
                    return Response({'error': ['User not found']}, status=status.HTTP_400_BAD_REQUEST)

                serializer = AdminSerializer(admin)

                token = Token.objects.get_or_create(user=user)

                return Response({'user': serializer.data, 'token': token[0].key})

            else:
                return Response({'error': ['Error Logging']}, status=status.HTTP_400_BAD_REQUEST)

        else:
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    except Exception as e:
        print(e)
        return Response({"error": "Something went wrong"}, status=500)
        

@api_view(["GET"])
@permission_classes([IsAuthenticated])
def getUser(request):
    try:
        user = request.user

        type = user.role

        if type == 'HOSPITAL':
            hospital = Hospital.objects.filter(user=user).first()

            if not hospital:
                return Response({'error': ['User not found']}, status=status.HTTP_400_BAD_REQUEST)

            serializer = HospitalSerializer(hospital)

            return Response({'user': serializer.data})

        elif type == 'DOCTOR':
            doctor = Doctor.objects.filter(user=user).first()

            if not doctor:
                return Response({'error': ['User not found']}, status=status.HTTP_400_BAD_REQUEST)

            serializer = DoctorSerializer(doctor)

            return Response({'user': serializer.data})

        elif type == 'PATIENT':
            patient = Patient.objects.filter(user=user).first()

            if not patient:
                return Response({'error': ['User not found']}, status=status.HTTP_400_BAD_REQUEST)

            serializer = PatientSerializer(patient)

            return Response(serializer.data)

        elif type == 'ADMIN':
            admin = Admin.objects.filter(user=user).first()

            if not admin:
                return Response({'error': ['User not found']}, status=status.HTTP_400_BAD_REQUEST)

            serializer = AdminSerializer(admin)

            return Response({'user': serializer.data})

        else:
            return Response({'error': ['Error fetching user']}, status=status.HTTP_400_BAD_REQUEST)

    except Exception as e:
        print(e)
        return Response({"error": "Something went wrong"}, status=500)
        

@api_view(["GET"])
@permission_classes([IsAuthenticated])
def getPatients(request):
    try:
        patients = Patient.objects.all()

        serializer = PatientSerializer(patients, many=True)

        return Response(serializer.data)

    except Exception as e:
        print(e)
        return Response({"error": "Something went wrong"}, status=500)


@api_view(["GET"])
@permission_classes([IsAuthenticated])
def getHospitals(request):
    try:
        hospitals = Hospital.objects.all()

        serializer = HospitalSerializer(hospitals, many=True)

        return Response(serializer.data)

    except Exception as e:
        print(e)
        return Response({"error": "Something went wrong"}, status=500)


@api_view(["GET"])
@permission_classes([IsAuthenticated])
def getDoctors(request):
    try:
        doctors = Doctor.objects.all()

        serializer = DoctorSerializer(doctors, many=True)

        return Response(serializer.data)

    except Exception as e:
        print(e)
        return Response({"error": "Something went wrong"}, status=500)


class DoctorViewSet(viewsets.ModelViewSet):
    serializer_class = DoctorSerializer
    queryset = Doctor.objects.all()


class HospitalViewSet(viewsets.ModelViewSet):
    serializer_class = HospitalSerializer
    queryset = Hospital.objects.all()


class PatientViewSet(viewsets.ModelViewSet):
    serializer_class = PatientSerializer
    queryset = Patient.objects.all()
