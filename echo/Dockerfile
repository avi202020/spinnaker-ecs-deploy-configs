FROM openjdk:8u111-jre-alpine


COPY ./echo/echo-web/build/install/echo /opt/echo
COPY ./echo.yml /opt/spinnaker/config/echo.yml

RUN apk --nocache add --update bash

CMD ["/opt/echo/bin/echo"]
