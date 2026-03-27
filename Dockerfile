FROM tomcat:9
RUN rm -rf /usr/local/tomcat/webapps/*
COPY target/*.war /usr/local/tomcat/webapps/app.war
EXPOSE 8080
