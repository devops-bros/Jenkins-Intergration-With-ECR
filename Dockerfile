# Pull base image 
FROM 8.5.89-jre8-temurin-jammy 

# Maintainer 
MAINTAINER "devops-bros@example.com" 
ENV TOMCAT_VERSION=8.5.89
EXPOSE 8080
#COPY ./webapp.war /usr/local/tomcat/webapps
CMD ["catalina.sh" "run"]
