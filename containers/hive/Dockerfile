FROM amazoncorretto:8u362-alpine3.17-jre

WORKDIR /opt

ENV HADOOP_VERSION=3.3.4
ENV METASTORE_VERSION=3.1.3

ENV HADOOP_HOME=/opt/hadoop-${HADOOP_VERSION}
ENV HIVE_HOME=/opt/apache-hive-metastore-${METASTORE_VERSION}-bin

RUN apk update && apk add netcat-openbsd curl bash

RUN curl -s -L https://repo1.maven.org/maven2/org/apache/hive/hive-standalone-metastore/${METASTORE_VERSION}/hive-standalone-metastore-${METASTORE_VERSION}-bin.tar.gz | tar zxf - && \
    curl -s -L https://archive.apache.org/dist/hadoop/common/hadoop-${HADOOP_VERSION}/hadoop-${HADOOP_VERSION}.tar.gz | tar zxf - && \
    wget -q https://jdbc.postgresql.org/download/postgresql-42.5.4.jar && \
    mv postgresql-42.5.4.jar ${HIVE_HOME}/lib/

COPY ./containers/hive/entrypoint.sh /entrypoint.sh

RUN addgroup --system hive --gid=1000 && \
    adduser --system --home ${HIVE_HOME} --ingroup hive --uid 1000 hive && \
    chown hive:hive -R ${HIVE_HOME} && \
    chown hive:hive /entrypoint.sh && chmod +x /entrypoint.sh

USER hive
EXPOSE 9083

ENTRYPOINT ["sh", "-c", "/entrypoint.sh"]
