# Trigger Build

This is a wercker step that triggers another pipeline build.

You will need to create a personal API access token for wercker

Example:

    build:
      steps:
        - petrica/trigger-build:
            pipeline-id: $WERCKER_PIPELINE_ID
            token: $WERCKER_API_TOKEN
            branch: master


