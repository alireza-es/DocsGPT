#!/bin/bash

source .env

docker compose -f docker-compose-dev.yaml up -d

. venv/bin/activate

flask --app application/app.py run --host=0.0.0.0 --port=7091

celery -A application.app.celery worker -l DEBUG --pool solo