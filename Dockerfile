FROM java:openjdk-8-jdk


RUN echo "deb [check-valid-until=no] http://archive.debian.org/debian jessie-backports main" > /etc/apt/sources.list.d/jessie-backports.list && \
  sed -i '/deb http:\/\/deb.debian.org\/debian jessie-updates main/d' /etc/apt/sources.list

RUN  apt-get -o Acquire::Check-Valid-Until=false update && \
  apt-get install -y base-files lsb-release lsb-base

# default 1.15.0, override with --build-arg switch
ARG VERSION="1.15.0"
ENV DRILL_VERSION=${VERSION}

ADD ./apache-drill-${DRILL_VERSION}.tar.gz /opt/drill/

COPY entrypoint.sh /app/

EXPOSE 8047 31010

ENTRYPOINT ["/app/entrypoint.sh"]
