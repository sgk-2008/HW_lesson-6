FROM openjdk:8-jdk-alpine
VOLUME /tmp
RUN apt-get update
RUN apt-get install -y tomcat10
RUN apt-get install -y maven
RUN atp-get install -y git
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git
RUN mvn package
EXPOSE 8080
RUN cp hello-1.0.war /var/lib/tomcat10/webapps/
RUN /var/lib/tomcat10/webapps/hello-1.0/