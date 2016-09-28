#!/usr/bin/env bash

cd $(dirname ${BASH_SOURCE:-$0})

. _settings.sh

python -c "import os; print(open('nginx-app-template.conf').read() % os.environ)" > nginx-app.conf

${DOCKER_COMMAND} build -t ${APP_NAME} .
