#!/bib/bash

oc patch dc/$APP_NAME -p "
{
  \"spec\": {
    \"template\": {
      \"spec\": {
        \"serviceAccountName\": \"ignite\",
        \"containers\": [
          {
          \"env\": [
            {
              \"name\": \"OPENSHIFT_NAMESPACE\",
              \"valueFrom\": {
                \"fieldRef\": {
                  \"fieldPath\": \"metadata.namespace\"
                }
              }
            },
            {
              \"name\": \"POD_IP\",
              \"valueFrom\": {
                \"fieldRef\": {
                  \"fieldPath\": \"status.podIP\"
                }
              }
            },
            {
              \"name\": \"OPENSHIFT_SERVICE_IGNITE\",
              \"value\": \"ignite\"
            }
          ],
          \"name\": \"$APP_NAME\"
          }
        ]
      }
    }
  }
}
"
