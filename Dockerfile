FROM maven:3.6.0-jdk-8-slim AS build
WORKDIR /var
COPY .mvn/ .mvn
COPY pom.xml ./
RUN mvn clean install -DskipTests
COPY src ./src
RUN chmod 755 /app/mvnw
CMD ["mvn", "spring-boot:run"]