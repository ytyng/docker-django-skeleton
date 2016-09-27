#!/usr/bin/env bash

cd $(dirname ${BASH_SOURCE:-$0})

. _settings.sh

${DOCKER_COMMAND} build -t ${APP_NAME} .
