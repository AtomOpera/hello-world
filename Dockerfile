# compile + package
FROM maven:3.8.5-openjdk-17 AS build
COPY . .
RUN mvn clean package -DskipTests
# jar created under target now

# run
FROM openjdk:17.0.1-jdk-slim
COPY --from=build /target/hello-world-0.0.1-SNAPSHOT.jar hello-world.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar", "hello-world.jar"]

# to run: 
# docker build -t givemeaname
# docker images
# docker run -p 8080:8080 givemeaname