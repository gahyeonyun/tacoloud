FROM maven:3.9.9-eclipse-temurin-21 AS build

COPY . .

RUN mvn clean package -DskipTests

# Run stage
FROM eclipse-temurin:21-jre-alpine

COPY --from=build target/tacoloud-0.0.1-SNAPSHOT.jar taco.jar

EXPOSE 8085

ENTRYPOINT ["java", "-jar", "taco.jar"]