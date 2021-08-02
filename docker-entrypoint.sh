#!/bin/bash
set -e

/app/config.sh --unattended --url $REPOSITORY_URL --token $REPOSITORY_TOKEN --replace

exec "/app/run.sh $@"