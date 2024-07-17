FROM maven:3.8.4-openjdk-8 AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package

FROM openjdk:8-jdk-alpine
VOLUME /tmp
EXPOSE 80
COPY --from=build /app/target/shipping-service-example-0.0.1-SNAPSHOT-spring-boot.jar app.jar
CMD ["java", "-jar", "app.jar"]


# intrucciones para generar una img y el contenedor corectamentes
# docker build -t be_shipping_service .
# docker run -d --name be_shipping_service_container -p 80:80 be_shipping_service 
# docker run -d --name be_shipping_service_container --network my_network -p 80:80 be_shipping_service
