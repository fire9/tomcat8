FROM fire9/centos7:1.0
LABEL maintainer="fire9 <fire9@me.com>"

ENV REFRESHED_AT 03-27-2019

RUN wget --no-cookies \
  --no-check-certificate \
  --header "Cookie: oraclelicense=accept-securebackup-cookie" \
  https://download.oracle.com/otn-pub/java/jdk/8u201-b09/42970487e3af4f5aa5bca3f542482c60/jdk-8u201-linux-x64.tar.gz && tar zxvf jdk-8u201-linux-x64.tar.gz -C /usr/local/ &&\
  wget http://mirror.rise.ph/apache/tomcat/tomcat-8/v8.5.39/bin/apache-tomcat-8.5.39.tar.gz && tar zxvf apache-tomcat-8.5.39.tar.gz -C /usr/local/

RUN ln -sf /usr/local/apache-tomcat-8.5.39 /usr/local/tomcat

ENV JAVA_HOME /usr/local/jdk1.8.0_201
ENV JRE_HOME /usr/local/jdk1.8.0_201/jre
ENV JAVA_BIN /usr/local/jdk1.8.0_201/bin
ENV CATALINA_HOME /usr/local/tomcat
ENV PATH $PATH:/usr/local/jdk1.8.0_201/bin:/usr/local/jdk1.8.0_201/jre/bin:$CATALINA_HOME/bin
ENV CLASSPATH /usr/local/jdk1.8.0_201/jre/bin:/usr/local/jdk1.8.0_201/lib:/usr/local/jdk1.8.0_201/jre/lib/charsets.jar

ARG JAVA_OPTS=""
# COPY xxx.war /usr/local/tomcat/webapps/xxx.war

WORKDIR /usr/local/tomcat/webapps

EXPOSE 8080

CMD ["catalina.sh", "run"]
