FROM openjdk:8-jdk

RUN sed -i '/jessie-updates/d' /etc/apt/sources.list  # Now Archived

RUN apt-get update && apt-get install -y base-files lsb-release lsb-base

# default 1.15.0, override with --build-arg switch
ARG VERSION="1.15.0"
ENV DRILL_VERSION=${VERSION}

WORKDIR /opt/drill
ADD https://mirrors.ocf.berkeley.edu/apache/drill/drill-${DRILL_VERSION}/apache-drill-${DRILL_VERSION}.tar.gz .
RUN tar -xvzf apache-drill-${DRILL_VERSION}.tar.gz

COPY entrypoint.sh /app/

EXPOSE 8047 31010

ENTRYPOINT ["/app/entrypoint.sh"]
