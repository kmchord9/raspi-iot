# -*- coding: utf-8 -*-

import os
import sys
import subprocess

#ライブラリインストール
#subprocess.run(["pip", "install", "-r", "requirements.txt"])

import django

DJANGO_DB_NAME="default"
DJANGO_SU_NAME="admin"
DJANGO_SU_EMAIL="admin@my.company"
DJANGO_SU_PASSWORD="mypass"
DJANGO_SETTING_MODULE="DJANGO_SETTING_MODULE"

#データベースのセットアップ
subprocess.run(["python", "/work/django-api-server/manage.py", "makemigrations"])
subprocess.run(["python", "/work/django-api-server/manage.py", "migrate"])
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'project.settings')  
django.setup() 

from django.contrib.auth.management.commands.createsuperuser import get_user_model 
get_user_model()._default_manager.db_manager(DJANGO_DB_NAME).create_superuser( 
  username = DJANGO_SU_NAME, 
  email = DJANGO_SU_EMAIL, 
  password = DJANGO_SU_PASSWORD)