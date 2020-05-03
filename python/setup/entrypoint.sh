#!/bin/sh
echo "start entrypoint"

echo "init contena" > /work/django-api-server/__afterRemoveFile__.txt
python -m http.server 3000

echo "end entrypoint"