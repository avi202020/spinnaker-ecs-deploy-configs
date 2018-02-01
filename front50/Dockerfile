FROM openjdk:8u111-jre-alpine


COPY ./front50/front50-web/build/install/front50 /opt/front50
COPY ./front50.yml /opt/spinnaker/config/front50.yml

RUN apk --nocache add --update bash

CMD ["/opt/front50/bin/front50"]
