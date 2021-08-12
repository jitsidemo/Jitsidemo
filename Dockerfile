FROM openjdk:8

ADD target/jitsidemobackend-0.0.1-SNAPSHOT.jar jitsidemobackend.jar

EXPOSE 8081
EXPOSE 8082

ENTRYPOINT ["java","-jar","jitsidemobackend.jar"]

