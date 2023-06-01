# Pull base image 
FROM tomcat:8-jre8 

# Maintainer 
MAINTAINER "devops-bros@example.com" 
COPY ./webapp/target/webapp.war /usr/local/tomcat/webapps 
EXPOSE 8082
CMD ["catalina.sh" "run"]
