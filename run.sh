#!/bin/bash

WTB_ENDPOINT="https://app.wercker.com/api/v3/runs/"


WTB_JSON="{\"applicationId\": \"$WERCKER_TRIGGER_BUILD_APPLICATION_ID\", \
\"pipelineId\": \"$WERCKER_TRIGGER_BUILD_PIPELINE_ID\", \
\"branch\": \"$WERCKER_GIT_BRANCH\", \
\"sourceRunId\": \"$WERCKER_RUN_ID\", \
\"message\": \"$(git log -1 --pretty=%s)\"}"
echo "$WTB_JSON"
echo "Calling $WTB_ENDPOINT"

if ! curl --fail -k --write-out "\n\nStatus code: %{http_code}\n" -H "Content-type: application/json" -H "Authorization: Bearer $WERCKER_TRIGGER_BUILD_TOKEN" "$WTBC_ENDPOINT" -d "$WTBC_JSON"; then
  faild "$WBTC_TRIGGER_RESPONSE"
fi

success "\nBuild triggered successfully."


