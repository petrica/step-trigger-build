#Trigger Build

This is a wercker step that triggers another build

You will need to create a personal API access token for wercker

Environment variable WERCKER_APPLICATION_ID is provided by default.

Example:

    build:
      steps:
        - petrica/trigger-build:
            application-id: $WERCKER_APPLICATION_ID
            pipeline-id: $WERCKER_PIPELINE_ID
            token: $WERCKER_API_TOKEN


