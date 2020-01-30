FROM openjdk:8-jre-alpine
EXPOSE 8080
WORKDIR /usr/src/app/target
COPY /target/*.jar .
ENTRYPOINT [ "sh", "-c", "java $JAVA_OPTS -Dspring.profiles.active=$DEPLOY_ENV -Djava.security.egd=file:/dev/./urandom -Xmx1000m -Xms128m -jar /usr/src/app/target/*.jar" ]
