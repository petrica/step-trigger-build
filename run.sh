#!/bin/bash

WTB_ENDPOINT="https://app.wercker.com/api/v3/builds/


WTB_JSON="{\"applicationId\": \"$WERCKER_TRIGGER_BUILD_APPLICATION_ID\", \
\"branch\": \"$WERCKER_GIT_BRANCH\", \
\"message\": \"$WERCKER_TRIGGER_BUILD_MESSAGE\"}"
curl -s -H "Content-type: application/json" -H "Authorization: Bearer $WERCKER_WAIT_FOR_BUILD_TOKEN" "$WWFB_ENDPOINT" -d $JSON

