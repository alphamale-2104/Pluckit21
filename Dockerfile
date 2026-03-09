# Use official Tomcat image
FROM tomcat:9.0

# Remove default ROOT application
RUN rm -rf /usr/local/tomcat/webapps/ROOT

# Copy your project files into Tomcat ROOT
COPY web/ /usr/local/tomcat/webapps/ROOT/

# Expose port
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]