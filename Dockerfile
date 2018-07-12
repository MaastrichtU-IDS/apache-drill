FROM java:openjdk-8-jdk

RUN apt-get update && apt-get install -y base-files lsb-release lsb-base

WORKDIR /tmp

COPY apache-drill-1.13.0.tar.gz ./

RUN mkdir -p /opt/drill && \
  tar zxpf apache-drill-1.13.0.tar.gz -C /opt/drill && \
  rm -f apache-drill-1.13.0.tar.gz

ENV PATH="/opt/drill/apache-drill-1.13.0/bin:${PATH}"

WORKDIR /app

COPY run.sh ./

EXPOSE 8047
EXPOSE 31010

ENTRYPOINT ["./run.sh"]


