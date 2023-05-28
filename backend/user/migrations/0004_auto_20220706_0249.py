# Generated by Django 3.2.12 on 2022-07-05 21:19

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('user', '0003_auto_20220706_0241'),
    ]

    operations = [
        migrations.AlterField(
            model_name='patient',
            name='doctor',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='user.doctor'),
        ),
        migrations.AlterField(
            model_name='patient',
            name='status',
            field=models.CharField(choices=[('POSITIVE', 'Positive'), ('NEGATIVE', 'Negative'), ('DISEASED', 'Diseased')], default='NEGATIVE', max_length=10),
        ),
    ]
