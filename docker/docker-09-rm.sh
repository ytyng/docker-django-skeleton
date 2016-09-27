#!/usr/bin/env bash

cd $(dirname ${BASH_SOURCE:-$0})

. _settings.sh

${DOCKER_COMMAND} rm --force ${APP_NAME}
