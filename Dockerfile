FROM openjdk:8-jdk

# default 1.15.0, override with --build-arg switch
ARG VERSION="1.15.0"
ENV DRILL_VERSION=${VERSION}

ADD http://apache.40b.nl/drill/drill-${DRILL_VERSION}/apache-drill-${DRILL_VERSION}.tar.gz /opt/drill/

#WORKDIR /opt/drill
#RUN wget http://apache.40b.nl/drill/drill-${DRILL_VERSION}/apache-drill-${DRILL_VERSION}.tar.gz \
#  && tar -xvzf apache-drill-${DRILL_VERSION}.tar.gz

RUN sed -i '/jessie-updates/d' /etc/apt/sources.list  # Now Archived

RUN apt-get update && apt-get install -y base-files lsb-release lsb-base

COPY entrypoint.sh /app/

EXPOSE 8047 31010

ENTRYPOINT ["/app/entrypoint.sh"]
