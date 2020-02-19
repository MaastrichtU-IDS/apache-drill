FROM openjdk:8-jdk

RUN sed -i '/jessie-updates/d' /etc/apt/sources.list 
# Now Archived

RUN apt-get update && apt-get install -y base-files lsb-release lsb-base

# Default version, override with --build-arg switch
ARG VERSION="1.17.0"
ENV DRILL_VERSION=${VERSION}

# Usually 4-8G
ARG DRILL_HEAP="4G"
ARG DRILLBIT_MAX_MEMORY="8G"
# Java memory limit per node. Up to 100G

ENV DRILL_HEAP=${DRILL_HEAP}
ENV DRILLBIT_MAX_PROC_MEM=${DRILLBIT_MAX_MEMORY}
ENV DRILLBIT_MAX_DIRECT_MEMORY=${DRILLBIT_MAX_MEMORY}

WORKDIR /opt/drill

ADD http://apache.40b.nl/drill/drill-${DRILL_VERSION}/apache-drill-${DRILL_VERSION}.tar.gz .
RUN tar -xvzf apache-drill-${DRILL_VERSION}.tar.gz

COPY entrypoint.sh /app/

EXPOSE 8047 31010

ENTRYPOINT ["/app/entrypoint.sh"]