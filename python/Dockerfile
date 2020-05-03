FROM python:3.7

#ENV DJANGO_DB_NAME=default
#ENV DJANGO_SU_NAME=admin
#ENV DJANGO_SU_EMAIL=admin@my.company
#ENV DJANGO_SU_PASSWORD=mypass
#ENV DJANGO_SETTING_MODULE=DJANGO_SETTING_MODULE


#必要に応じてパッケージを追加する
#RUN apt-get update && apt-get install -y --no-install-recommends \
#    vim \
#    &&rm -rf /var/lib/apt/lists/* \
#    &&apt-get clean

RUN mkdir -p work && \
    cd work
#    git clone https://github.com/kmchord9/django-api-server.git


COPY setup/ /work/setup/
#COPY django-api-server/ /work/django-api-server 

#WORKDIR /work/django-api-server

#RUN pip install -r requirements.txt

#RUN python manage.py makemigrations && \
#    python manage.py migrate
    
#初期設定
#RUN python -c "import os; \
#    import sys; \
#    import django; \
#    os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'project.settings'); \ 
#    django.setup(); \
#    from django.contrib.auth.management.commands.createsuperuser import get_user_model; \
#    get_user_model()._default_manager.db_manager('$DJANGO_DB_NAME').create_superuser( \
#        username='$DJANGO_SU_NAME', \
#        email='$DJANGO_SU_EMAIL', \
#        password='$DJANGO_SU_PASSWORD')"
ENTRYPOINT [ "sh", "+x", "/work/setup/entrypoint2.sh" ]
#サーバー起動
#CMD [ "python", "manage.py", "runserver", "0.0.0.0:3000" ]
CMD [ "python", "-m", "http.server", "3000" ]
