FROM maven:3.8-jdk-8-slim as builder
RUN apt update -y && apt install git -y
RUN git clone https://github.com/skmdab/maven-web-application.git
WORKDIR /maven-web-application
RUN mvn clean package

FROM tomcat:9-jdk8-corretto
COPY --from=builder /maven-web-application/target/maven-web-application*.war /usr/local/tomcat/webapps/
