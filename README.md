#Trigger Build

This is a wercker step that triggers another build

You will need to create a personal API access token for wercker

Example:

    build:
      steps:
        - canopytax/trigger-build:
            application-id: APP_ID
            message: MESSAGE
            token: WERCKER_API_TOKEN


