FROM tomcat:9.0-jdk8
RUN apt-get update && apt-get install -y wget maven git
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git "/tmp/mvn/1"
RUN mvn package -B -f /tmp/mvn/1
RUN cp /tmp/mvn/1/target/hello-1.0.war /usr/local/tomcat/webapps/
EXPOSE 8080
CMD ["catalina.sh", "run"]
