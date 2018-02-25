#!/bin/bash

oc create role ignite-discoverer --verb=get --resource=endpoints
oc create role ignite-discoverer-debug --verb=get,list --resource=endpoints,services,pods,namespaces

oc create serviceaccount ignite

oc create rolebinding ignite --role ignite-discoverer --serviceaccount $PROJECT_NAME:ignite --namespace $PROJECT_NAME
