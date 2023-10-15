#!/bin/bash

exec java \
  -jar \
  -Dbitbucket.pipelines.runner.account.uuid=$ACCOUNT_UUID \
  -Dbitbucket.pipelines.runner.repository.uuid=$REPOSITORY_UUID \
  -Dbitbucket.pipelines.runner.uuid=$RUNNER_UUID \
  -Dbitbucket.pipelines.runner.oauth.client.id=$OAUTH_CLIENT_ID \
  -Dbitbucket.pipelines.runner.oauth.client.secret=$OAUTH_CLIENT_SECRET \
  -Dbitbucket.pipelines.runner.directory.working=$WORKING_DIRECTORY \
  -Dbitbucket.pipelines.runner.environment=$RUNNER_ENVIRONMENT \
  -Dbitbucket.pipelines.runner.runtime=$RUNTIME \
  -Dbitbucket.pipelines.runner.docker.uri=$DOCKER_URI \
  -Dbitbucket.pipelines.runner.scheduled.state.update.initial.delay.seconds=$SCHEDULED_STATE_UPDATE_INITIAL_DELAY_SECONDS \
  -Dbitbucket.pipelines.runner.scheduled.state.update.period.seconds=$SCHEDULED_STATE_UPDATE_PERIOD_SECONDS \
  -Dbitbucket.pipelines.runner.cleanup.previous.folders=$CLEANUP_PREVIOUS_FOLDERS \
  -Dlogback.configurationFile=$LOGBACK_CONFIGURATION_FILE \
  -Dfile.encoding=UTF-8 \
  -Dsun.jnu.encoding=UTF-8 \
  ./runner.jar
