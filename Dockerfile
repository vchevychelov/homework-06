FROM ubuntu:20.04
RUN apt update
RUN apt install git -y
RUN apt install wget -y
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install default-jdk -y
RUN apt install maven -y
RUN mkdir /usr/local/tomcat
RUN wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.69/bin/apache-tomcat-9.0.69.tar.gz -O /tmp/tomcat.tar.gz
RUN cd /tmp && tar xvfz tomcat.tar.gz
RUN cp -Rv /tmp/apache-tomcat-9.0.69/* /usr/local/tomcat/
RUN cd /usr/local/tomcat/
EXPOSE 8080
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git
RUN mvn -f /boxfuse-sample-java-war-hello/pom.xml clean package
RUN cp /boxfuse-sample-java-war-hello/target/hello-1.0.war /usr/local/tomcat/webapps/
CMD ["/usr/local/tomcat/bin/catalina.sh", "run"]
