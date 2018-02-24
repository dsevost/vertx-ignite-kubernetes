Пример тестового приложения для проверки функциоанал Vert.x + Apache Ignite в OpenShift 

Создание приложения в OpenShift с помощью механизма сборок типа S2I (Source-to-Image) 

Переменные окружения для S2I образа Red Hat OpenJDK 1.8 

https://access.redhat.com/documentation/en-us/red_hat_jboss_middleware_for_openshift/3/html/red_hat_java_s2i_for_openshift/reference

$ export PROJECT_NAME=ignite-vertex APP_NAME=timestamp IGNITE_SVC_NAME=ignite

$ export GIT_REPO="https://github.com/dsevost/vertx-ignite-kubernetes" 

$ export GIT_REF="#dev" 

$ # export MAVEN_MIRROR_URL=http://your.nexus.domain 

$ oc new-project $PROJECT_NAME

$ oc new-app redhat-openjdk18-openshift~$GIT_REPO$GIT_REF --build-env MAVEN_MIRROR_URL=$MAVEN_MIRROR_URL -e JAVA_APP_JAR=app-fat.jar --name $APP_NAME

$ cat << EOF
1. create special service account for query Openshift API to obtain Ignite node's enpoints
2. create special role which allows query 'endpoints' resources for current project
3. create rolebinding for serviceaccount and role
EOF

$ sh openshift/create-ignite_permission.sh

$ sh openshift/create-ignite_svc.sh

$ sh openshift/patch-dc.sh

$ oc expose svc $APP_NAME --port 8080

$ echo Clean all ; oc delete bc,dc,is,rolebinding,role,route,sa,svc -l app=$APP_NAME

