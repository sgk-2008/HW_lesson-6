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
ARG JAVA_OPTS
ENV JAVA_OPTS=$JAVA_OPTS
COPY hwlesson6.jar hwlesson6.jar
EXPOSE 8080
ENTRYPOINT exec java $JAVA_OPTS -jar hwlesson6.jar
# For Spring-Boot project, use the entrypoint below to reduce Tomcat startup time.
#ENTRYPOINT exec java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar hwlesson6.jar
