from django.contrib import admin
from django.contrib.auth.models import Group
from django.contrib.auth.admin import UserAdmin as BaseUserAdmin
from django.utils.translation import gettext_lazy as _
from .models import User, Hospital, Doctor, Patient, Admin
import numpy as np


class UserAdmin(BaseUserAdmin):

    fieldsets = (
        (None, {'fields': ('username', 'password', 'role')}),
        (_('Personal info'), {'fields': ('name', 'contact_number')}),
        (_('Important dates'), {'fields': ('last_login', 'date_joined')}),
    )
    add_fieldsets = (
        (None, {
            'classes': ('wide',),
            'fields': ('username', 'password1', 'password2'),
        }),
    )
    list_display = ('username', 'name', 'contact_number', 'role')
    search_fields = ('username', 'name')
    ordering = ('username',)


admin.site.register(User, UserAdmin)
admin.site.unregister(Group)


class AdminAdmin(admin.ModelAdmin):
    list_display = [field.name for field in Admin._meta.fields]


admin.site.register(Admin, AdminAdmin)


class DoctorAdmin(admin.ModelAdmin):
    list_display = [field.name for field in Doctor._meta.fields]


admin.site.register(Doctor, DoctorAdmin)


class HospitalAdmin(admin.ModelAdmin):
    list_display = [field.name for field in Hospital._meta.fields]


admin.site.register(Hospital, HospitalAdmin)


class PatientAdmin(admin.ModelAdmin):
    list_display = [field.name for field in Patient._meta.fields]


admin.site.register(Patient, PatientAdmin)
