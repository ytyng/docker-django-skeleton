#!/usr/bin/env bash

. _settings.sh

${DOCKER_COMMAND} rm --force ${APP_NAME}
