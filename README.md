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
            message: custom trigger message

## Getting the Pipeline ID
You can get pipeline id using the API, as illustrated below: 
- https://app.wercker.com/api/v3/applications/sanskrit-coders to find out the applicationId, 
- and then https://app.wercker.com/api/v3/workflows?applicationId=5cb97db5fd8b5b0800eeb81a to get the pipelineId.
