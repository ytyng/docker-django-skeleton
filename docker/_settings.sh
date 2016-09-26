#!/usr/bin/env bash

export APP_NAME=docker-django-skeleton
export DJANGO_APP_NAME=docker_django_skeleton

PROJECT_DIR=$(cd $(dirname $0)/..;pwd)

if [ "`which docker-machine`" ]; then
    # mac
    eval "$(docker-machine env default)"
    DOCKER_COMMAND=docker
    DOCKER_MACHINE_COMMAND=docker-machine
    LOG_DIR=/tmp/log/${APP_NAME}
    export UWSGI_PROCESSES=1
    export UWSGI_THREADS=1
    export DJANGO_SETTINGS_MODULE=${DJANGO_APP_NAME}.settings.local
else
    # ubuntu
    DOCKER_COMMAND="sudo docker"
    LOG_DIR=/var/log/${APP_NAME}
    # OPTIONAL_PARAMS="--link mysql:mysql"
    RUN_COMMAND="supervisord -n"
    export UWSGI_PROCESSES=2
    export UWSGI_THREADS=2
    export DJANGO_SETTINGS_MODULE=${DJANGO_APP_NAME}.settings.production
fi
