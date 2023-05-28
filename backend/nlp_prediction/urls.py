from django.urls import path, include
from rest_framework.routers import DefaultRouter

from .views import getPrediction

urlpatterns = [
    path('prediction', getPrediction),
]
