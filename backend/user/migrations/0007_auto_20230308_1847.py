# Generated by Django 3.2.18 on 2023-03-08 18:47

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('user', '0006_patient_address'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='patient',
            name='is_death_approved',
        ),
        migrations.RemoveField(
            model_name='patient',
            name='status',
        ),
    ]
