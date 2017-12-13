FROM openjdk:8u111-jre-alpine

MAINTAINER dl-cd@lookout.com

COPY ./clouddriver/clouddriver-web/build/install/clouddriver /opt/clouddriver
COPY ./clouddriver.yml /opt/spinnaker/config/clouddriver.yml

RUN apk --nocache add --update bash

CMD ["/opt/clouddriver/bin/clouddriver"]
