FROM maven:3-openjdk-11 as build

COPY . .

RUN mvn clean package -DskipTests


FROM bellsoft/liberica-openjdk-alpine:11

ARG APP_HOME=/app \
    maven_artifactId \
    maven_version

ENV APP=${maven_artifactId}-${maven_version} \
    TZ=Europe/Moscow

WORKDIR $APP_HOME

COPY --from=build ./target/${APP}.jar .

RUN set -x; \
    adduser -D java && \
    apk add --no-cache tzdata

USER java

CMD java ${JAVA_OPTS} -jar ${APP}.jar
