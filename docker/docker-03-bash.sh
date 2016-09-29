#!/usr/bin/env bash

cd $(dirname ${BASH_SOURCE:-$0})

. _settings.sh

EXISTS=$(${DOCKER_COMMAND} ps |grep ${APP_NAME})

if [ "${EXISTS}" ]; then
    ${DOCKER_COMMAND} exec -it ${APP_NAME} /bin/bash "$@"
else
    ${DOCKER_COMMAND} run --rm -it \
    -e DJANGO_SETTINGS_MODULE=${DJANGO_SETTINGS_MODULE} \
    -v ${PROJECT_DIR}:/var/django/${APP_NAME} \
    --name ${APP_NAME} ${APP_NAME} /bin/bash "$@"
fi
