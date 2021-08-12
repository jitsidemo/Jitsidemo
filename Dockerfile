FROM openjdk:8

ADD target/jitsidemobackend-0.0.1-SNAPSHOT.jar jitsidemobackend.jar

EXPOSE 8090
EXPOSE 8091

ENTRYPOINT ["java","-jar","jitsidemobackend.jar"]


