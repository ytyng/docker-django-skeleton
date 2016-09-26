#!/usr/bin/env bash

. _settings.sh

EXIST=`${DOCKER_COMMAND} ps |grep ${APP_NAME}`

if [ "${EXIST}" ]; then
    ${DOCKER_COMMAND} exec -it ${APP_NAME} \
    /bin/bash -c "cd /var/django/${APP_NAME}/${APP_NAME}/; ./manage.py $*"

else
    ${DOCKER_COMMAND} run -it \
    -e DJANGO_SETTINGS_MODULE=${DJANGO_SETTINGS_MODULE} \
    -v ${PROJECT_DIR}:/var/django/${APP_NAME} \
    ${APP_NAME} /bin/bash -c \
    "cd /var/django/${APP_NAME}/${APP_NAME}/; ./manage.py $*"
fi
