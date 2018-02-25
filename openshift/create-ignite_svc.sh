#!/bin/bash

oc expose dc $APP_NAME --port 9042 --name $IGNITE_SVC_NAME  --cluster-ip='None'
