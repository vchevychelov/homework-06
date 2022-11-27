FROM ubuntu:20.04
RUN apt update
RUN apt install git -y
RUN apt install wget -y
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install default-jdk -y
RUN apt install maven -y

EXPOSE 8080
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git
RUN mvn -f /boxfuse-sample-java-war-hello/pom.xml clean package
RUN cp /boxfuse-sample-java-war-hello/target/hello-1.0.war /var/lib/tomcat9/webapps/
CMD ["catalina.sh", "run"]