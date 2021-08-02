#!/bin/bash
set -e

/app/config.sh --unattended --url $REPOSITORY_URL --token $REPOSITORY_TOKEN --replace --labels $RUNNER_RUNS_ON

exec "/app/run.sh $@"