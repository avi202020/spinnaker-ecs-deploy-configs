FROM openjdk:8u111-jre-alpine


COPY ./orca/orca-web/build/install/orca /opt/orca
COPY ./orca.yml /opt/spinnaker/config/orca.yml

RUN apk --nocache add --update bash

CMD ["/opt/orca/bin/orca"]
