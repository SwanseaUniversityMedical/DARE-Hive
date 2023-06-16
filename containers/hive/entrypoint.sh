#!/bin/sh

export HADOOP_HOME=/opt/hadoop-${HADOOP_VERSION}
export HADOOP_CLASSPATH=${HADOOP_HOME}/share/hadoop/tools/lib/aws-java-sdk-bundle-1.12.262.jar:${HADOOP_HOME}/share/hadoop/tools/lib/hadoop-aws-${HADOOP_VERSION}.jar
export METASTORE_DB_HOSTNAME=${METASTORE_DB_HOSTNAME:-localhost}

echo "Waiting for database on ${METASTORE_DB_HOSTNAME} to launch on 5432 ..."

while ! nc -z ${METASTORE_DB_HOSTNAME} 5432; do
  sleep 1
done

echo "Database on ${METASTORE_DB_HOSTNAME}:5432 started"
echo "Init apache hive metastore on ${METASTORE_DB_HOSTNAME}:5432"

/opt/apache-hive-metastore-3.1.3-bin/bin/schematool -initSchema -dbType postgres
/opt/apache-hive-metastore-3.1.3-bin/bin/start-metastore
