# Multistage build process
# Build stage
FROM maven:3.8.4-jdk-11 AS build

COPY src /home/app/src
COPY pom.xml /home/app
RUN mvn -f /home/app/pom.xml clean package

# RUN ls /home/app/target


# Debug stage
# FROM ubuntu:latest
# RUN  mkdir /my_app
# COPY --from=build /home/app/target/*  /my_app



# Package stage
FROM openjdk:11 AS test
# RUN mkdir -p my_app

COPY --from=build /home/app/target/maven-pipeline-demo-1.0-SNAPSHOT.jar /usr/local/lib/maven-pipeline-demo-1.0-SNAPSHOT.jar
ENTRYPOINT [ "java", "-jar", "/usr/local/lib/maven-pipeline-demo-1.0-SNAPSHOT.jar" ]






# RUN useradd -m -u 1000 -s /bin/bash jenkins

# RUN yum install -y openssh-clients