FROM openjdk:8-jdk
VOLUME /tmp
RUN apt update
RUN apt install -y tomcat10
RUN apt install -y maven
RUN atp install -y git
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git
RUN mvn package
EXPOSE 8080
RUN cp hello-1.0.war /var/lib/tomcat10/webapps/
RUN /var/lib/tomcat10/webapps/hello-1.0/