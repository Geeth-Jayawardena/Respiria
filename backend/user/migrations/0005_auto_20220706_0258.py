# Generated by Django 3.2.12 on 2022-07-05 21:28

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('user', '0004_auto_20220706_0249'),
    ]

    operations = [
        migrations.RenameField(
            model_name='patient',
            old_name='isDeathApproved',
            new_name='is_death_approved',
        ),
        migrations.AlterField(
            model_name='patient',
            name='doctor',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='user.doctor'),
        ),
    ]
