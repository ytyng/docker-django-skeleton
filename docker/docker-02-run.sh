#!/usr/bin/env bash

cd $(dirname ${BASH_SOURCE:-$0})

. _settings.sh

mkdir -p -m 777 ${LOG_DIR}

${DOCKER_COMMAND} run -d -P -p 80:80 -p 443:443 \
  -v ${PROJECT_DIR}:/var/django/${APP_NAME} \
  -v ${LOG_DIR}:/var/log/django \
  -v /etc/localtime:/etc/localtime:ro \
  -e DJANGO_SETTINGS_MODULE=${DJANGO_SETTINGS_MODULE} \
  -e UWSGI_PROCESSES=${UWSGI_PROCESSES} \
  -e UWSGI_THREADS=${UWSGI_THREADS} \
  ${OPTIONAL_PARAMS} \
  --name ${APP_NAME} ${APP_NAME} ${RUN_COMMAND}

if [ "${DOCKER_MACHINE_COMMAND}" ]; then
    docker-machine ip default
fi

${DOCKER_COMMAND} ps
