#!/bin/bash

DJANGO_SU_NAME=admin
DJANGO_SU_PASSWORD=mypass
DJANGO_DB_NAME=default
DJANGO_SU_EMAIL=admin@my.company
DJANGO_SETTING_MODULE=DJANGO_SETTING_MODULE

#pip install
if [ -e requirements.txt ]; then
  pip install -r ../setup/requirements.txt
else
  echo "requirements.txt not found"
fi


if [ ! -e ../django-api-server/db.sqlite3 ]; then
  if [ -e ../django-api-server/manage.py ]; then
    #init BD
    cd ../django-api-server/
    python manage.py makemigrations && \
    python manage.py migrate
    #create database user
    python -c "import os; \
    import sys; \
    import django; \
    os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'project.settings'); \ 
    django.setup(); \
    from django.contrib.auth.management.commands.createsuperuser import get_user_model; \
    get_user_model()._default_manager.db_manager('$DJANGO_DB_NAME').create_superuser( \
        username='$DJANGO_SU_NAME', \
        email='$DJANGO_SU_EMAIL', \
        password='$DJANGO_SU_PASSWORD')"
  else
    echo "manage.py not found"
  fi
else
  echo "db.sqlite3 found"
fi

