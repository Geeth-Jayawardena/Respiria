# Resperia

## Create Environment

```
pyenv install 3.7
```

```
pyenv local 3.7
```

```
python3 -m venv .venv
```

```
source .venv/bin/activate
```

```
pip install tensorflow==2.3.0 scikit-learn numpy pandas librosa moviepy matplotlib seaborn ipykernel django django-model-utils django-extensions mysqlclient==2.1.0 djangorestframework martor django-cors-headers autopep8 django-filter djoser
```

### Create database named 'resperia_db' and import 'resperia_db.sql' located in the project root.

### Start Server

```
python manage.py runserver
```

## Login Credentials

### Admin

```
Username - admin@user.com
Password - 123456789
```

### Patient

```
Username - patient@user.com
Password - 123456789
```

### Hospital

```
Username - hospital@user.com
Password - 123456789
```

### Doctor

```
Username - doctor@user.com
Password - 123456789
```

### Extra Commands

```
python manage.py makemigrations
```

```
python manage.py migrate
```

```
python manage.py createsuperuser
```
