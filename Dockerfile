FROM ubuntu:16.04
RUN apt-get update
RUN apt-get install -y openjdk:8-jdk-alpine
RUN apt-get install -y tomcat10
RUN apt-get install -y maven
RUN atp-get install -y git
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git
EXPOSE 8080
RUN mkdir /myvol
VOLUME /myvol
RUN cp hello-1.0.war /var/lib/tomcat10/webapps/
RUN /var/lib/tomcat10/webapps/hello-1.0/
CMD ["java", "Main"]