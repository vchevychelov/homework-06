FROM ubuntu:20.04
RUN apt update
RUN apt install git -y
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install default-jdk -y
RUN apt install maven -y
RUN apt install tomcat9 -y
RUN mkdir boxfuse
RUN cd boxfuse
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git
RUN cd boxfuse-sample-java-war-hello
RUN mvn package
RUN cp hello-1.0.war /var/lib/tomcat9/webapps/
CMD ["catalina.sh", "run"]