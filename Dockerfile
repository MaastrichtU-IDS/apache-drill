FROM openjdk:8-jdk

RUN sed -i '/jessie-updates/d' /etc/apt/sources.list 
# Now Archived

RUN apt-get update && apt-get install -y base-files lsb-release lsb-base

# Default version, override with --build-arg switch
ARG VERSION="1.17.0"
ENV DRILL_VERSION=${VERSION}

# ENV DRILLBIT_MAX_PROC_MEM="100G"
# ENV DRILL_HEAP="50G"
# ENV DRILLBIT_MAX_DIRECT_MEMORY="100G"

WORKDIR /opt/drill

ADD http://apache.40b.nl/drill/drill-${DRILL_VERSION}/apache-drill-${DRILL_VERSION}.tar.gz .
RUN tar -xvzf apache-drill-${DRILL_VERSION}.tar.gz

COPY entrypoint.sh /app/

EXPOSE 8047 31010

ENTRYPOINT ["/app/entrypoint.sh"]