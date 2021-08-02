#!/bin/bash
set -e

if [ ! -f /app/.runner ]; then
  /app/config.sh --unattended --url $REPOSITORY_URL --token $REPOSITORY_TOKEN --replace --labels $RUNNER_RUNS_ON
fi

/app/run.sh $@
