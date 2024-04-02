FROM registry.cn-hangzhou.aliyuncs.com/public-toolbox/maven:3.8.3-openjdk-8-aliyun AS build
COPY src /home/app/src
COPY pom.xml /home/app
RUN ["/usr/local/bin/mvn-entrypoint.sh","mvn","-f","/home/app/pom.xml","clean","package","-Dmaven.test.skip=true"]

FROM registry.cn-hangzhou.aliyuncs.com/public-toolbox/openjdk:8-jdk-alpine
COPY --from=build /home/app/target/demo-0.0.1-SNAPSHOT.jar /usr/local/lib/demo-0.0.1-SNAPSHOT.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","/usr/local/lib/demo-0.0.1-SNAPSHOT.jar"]