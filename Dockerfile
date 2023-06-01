# Pull base image 
FROM 8.5.89-jre8

# Maintainer 
MAINTAINER "devops-bros@example.com" 
EXPOSE 8080
#COPY ./webapp.war /usr/local/tomcat/webapps
CMD ["catalina.sh" "run"]
