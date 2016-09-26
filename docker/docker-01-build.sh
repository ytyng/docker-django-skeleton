#!/usr/bin/env bash

. _settings.sh

${DOCKER_COMMAND} build -t ${APP_NAME} .
