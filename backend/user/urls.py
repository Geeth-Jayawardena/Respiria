from django.urls import path, include
from rest_framework.routers import DefaultRouter

from .views import register, login, getUser, DoctorViewSet, HospitalViewSet, PatientViewSet, getPatients, getDoctors, getHospitals

router = DefaultRouter()
router.register(r'doctor', DoctorViewSet)
router.register(r'hospital', HospitalViewSet)
router.register(r'patient', PatientViewSet)

urlpatterns = [
    path('register', register),
    path('login', login),
    path('user', getUser),
    path('patients', getPatients),
    path('hospitals', getHospitals),
    path('doctors', getDoctors),
    path('', include(router.urls)),
]
