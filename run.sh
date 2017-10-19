#!/bin/bash

if [ -z "$WERCKER_TRIGGER_BUILD_BRANCH" ]; then
  WERCKER_TRIGGER_BUILD_BRANCH="$WERCKER_GIT_BRANCH"
fi

GIT_MESSAGE=$(git log -1 --pretty=%s)

if [ "$WERCKER_TRIGGER_BUILD_MESSAGE" ]; then
	GIT_MESSAGE="$WERCKER_TRIGGER_BUILD_MESSAGE"
fi

generate_post_data()
{
  cat <<EOF
{
  "pipelineId": "$WERCKER_TRIGGER_BUILD_PIPELINE_ID",
  "branch": "$WERCKER_TRIGGER_BUILD_BRANCH",
  "message": "$GIT_MESSAGE"
}
EOF
}

echo "JSON: $(generate_post_data)"

if ! curl --fail -k --write-out "\n\nStatus code: %{http_code}\n" -H "Content-type: application/json" -H "Authorization: Bearer $WERCKER_TRIGGER_BUILD_TOKEN" -d "$(generate_post_data)" https://app.wercker.com/api/v3/runs/; then
  fail "$WBTC_TRIGGER_RESPONSE"
fi

success "\nBuild triggered successfully."


