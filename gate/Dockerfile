FROM openjdk:8u111-jre-alpine


COPY ./gate/gate-web/build/install/gate /opt/gate
COPY ./gate.yml /opt/spinnaker/config/gate.yml

RUN apk --nocache add --update bash

CMD ["/opt/gate/bin/gate"]
