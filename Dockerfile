FROM openjdk:17
EXPOSE 8081
ADD target/jenkins-integration.jar jenkins-integration.jar
ENTRYPOINT ["java", "-jar", "/jenkins-integration.jar"]
