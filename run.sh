#!/bin/bash

set -e

WTB_ENDPOINT="https://app.wercker.com/api/v3/runs/"


WTB_JSON="{\"applicationId\": \"$WERCKER_TRIGGER_BUILD_APPLICATION_ID\", \
\"pipelineId\": \"$WERCKER_TRIGGER_BUILD_PIPELINE_ID\", \
\"branch\": \"$WERCKER_GIT_BRANCH\", \
\"sourceRunId\": \"$WERCKER_RUN_ID\", \
\"message\": \"$(git log -1 --pretty=%s)\"}"
echo "$WTB_JSON"
echo "Calling $WTB_ENDPOINT"

export WERCKER_TRIGGER_RESPONSE=$(curl -s -k -H "Content-type: application/json" -H "Authorization: Bearer $WERCKER_TRIGGER_BUILD_TOKEN" "$WTB_ENDPOINT" -d "$WTB_JSON" | grep \"error\")

if [ ! -z "$WERCKER_TRIGGER_RESPONSE" ]; then
  echo "$WERCKER_TRIGGER_RESPONSE"
  exit 1
fi


