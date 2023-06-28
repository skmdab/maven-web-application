FROM maven:3.6.1-jdk-8-alpine as builder

RUN apk update && apk add git 

WORKDIR /tmp

RUN git clone https://github.com/skmdab/maven-web-application.git \
    && cd maven-web-application \
    && mvn clean package

FROM tomcat:8-jdk8-corretto

COPY --from=builder /tmp/maven-web-application/target/maven-web-application*.war /usr/local/tomcat/webapps/

EXPOSE 8080
