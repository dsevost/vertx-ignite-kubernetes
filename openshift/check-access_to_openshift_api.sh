#!/bin/bash

POD=$(oc get pods | awk "/${APP_NAME}-[0-9]+-/ && ! /build/ && /Running/ { print \$1; }" | head -n 1)
OPENSHIFT_NAMESPACE=$(oc rsh $POD printenv OPENSHIFT_NAMESPACE)
OPENSHIFT_NAMESPACE=$(echo $OPENSHIFT_NAMESPACE | strings)
TOKEN=$(oc rsh $POD cat /var/run/secrets/kubernetes.io/serviceaccount/token )

oc rsh $POD curl -v \
    --cacert /run/secrets/kubernetes.io/serviceaccount/service-ca.crt \
    -H "Authorization: Bearer $TOKEN" \
    "https://kubernetes.default.svc.cluster.local/api/v1/namespaces/$OPENSHIFT_NAMESPACE/endpoints/$IGNITE_SVC_NAME"
