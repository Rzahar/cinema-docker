FROM maven:3.8.4-jdk-11 as build
WORKDIR /app
COPY . .
RUN mvn package

FROM openjdk:11
WORKDIR /app
COPY --from=build /app/target/cinema-api-0.0.1-SNAPSHOT.jar ./app.jar
EXPOSE 8090
CMD ["java","-jar","app.jar"]