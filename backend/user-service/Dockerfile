FROM eclipse-temurin:21-jre-alpine

WORKDIR /app

# Install netcat for wait-for-it
RUN apk add --no-cache netcat-openbsd wget

# Add non-root user
RUN addgroup -S spring && adduser -S spring -G spring

# Copy wait script
COPY wait-for-it.sh /wait-for-it.sh
RUN chmod +x /wait-for-it.sh

# Copy JAR
COPY target/*.jar app.jar
RUN chown spring:spring app.jar

USER spring:spring

EXPOSE 8081

HEALTHCHECK --interval=30s --timeout=3s --start-period=60s --retries=3 \
  CMD wget --no-verbose --tries=1 --spider http://localhost:8081/actuator/health || exit 1

ENV JAVA_OPTS="-Xmx512m -Xms256m"

# Wait for postgres, then start
ENTRYPOINT ["/wait-for-it.sh", "postgres", "5432", "--", "sh", "-c", "java $JAVA_OPTS -jar app.jar"]