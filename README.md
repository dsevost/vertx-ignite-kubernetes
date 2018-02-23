Пример тестового приложения для проверки функциоанал Vert.x + Apache Ignite в OpenShift 

Создание приложения в OpenShift с помощью механизма сборок типа S2I (Source-to-Image) 

Переменные окружения для S2I образа Red Hat OpenJDK 1.8 

https://access.redhat.com/documentation/en-us/red_hat_jboss_middleware_for_openshift/3/html/red_hat_java_s2i_for_openshift/reference


$ export GIT_REPO="https://github.com/dsevost/vertx-ignite-kubernetes" 

$ export GIT_REF="#dev" 

$ # export MAVEN_MIRROR_URL=http://your.nexus.domain 

$ export JAVA_OPTIONS=-Dopenshift.namespace=\${OPENSHIFT_NAMESPACE}

$ oc new-app redhat-openjdk18-openshift~$GIT_REPO$GIT_REF --build-env MAVEN_MIRROR_URL=$MAVEN_MIRROR_URL -e JAVA_APP_JAR=app-fat.jar -e JAVA_OPTIONS="$JAVA_OPTIONS" 
