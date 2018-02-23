#!/bib/bash

oc patch dc/vertx-ignite-kubernetes -p '
{
  "spec": {
    "template": {
      "spec": {
        "serviceAccountName": "ignite",
        "containers": [
          {
          "env": [
            {
              "name": "OPENSHIFT_NAMESPACE",
              "valueFrom": {
                "fieldRef": {
                  "fieldPath": "metadata.namespace"
                }
              }
            }
          ],
          "name": "vertx-ignite-kubernetes"
          }
        ]
      }
    }
  }
}
'
