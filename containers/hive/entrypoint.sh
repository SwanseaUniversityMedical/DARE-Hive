#!/bin/sh

export METASTORE_DB_HOSTNAME=${METASTORE_DB_HOSTNAME:-localhost}

echo "Waiting for database on ${METASTORE_DB_HOSTNAME} to launch on 5432 ..."

while ! nc -z ${METASTORE_DB_HOSTNAME} 5432; do
  sleep 1
done

echo "Database on ${METASTORE_DB_HOSTNAME}:5432 started"
echo "Init apache hive metastore on ${METASTORE_DB_HOSTNAME}:5432"

/opt/apache-hive-metastore-3.1.3-bin/bin/schematool -initSchema -dbType postgres
/opt/apache-hive-metastore-3.1.3-bin/bin/start-metastore