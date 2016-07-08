#!/bin/bash

WTB_ENDPOINT="https://app.wercker.com/api/v3/runs/"


WTB_JSON="{\"applicationId\": \"$WERCKER_TRIGGER_BUILD_APPLICATION_ID\", \
\"pipelineId\": \"$WERCKER_TRIGGER_BUILD_PIPELINE_ID\", \
\"branch\": \"$WERCKER_GIT_BRANCH\", \
\"message\": \"$(git log -1 --pretty=%s)\"}"
echo "$WTB_JSON"

curl -s -H "Content-type: application/json" -H "Authorization: Bearer $WERCKER_TRIGGER_BUILD_TOKEN" "$WTB_ENDPOINT" -d "$WTB_JSON"

