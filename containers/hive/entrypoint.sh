#!/bin/sh

export METASTORE_DB_HOSTNAME=${METASTORE_DB_HOSTNAME:-localhost}
export METASTORE_DB_PORT=${METASTORE_DB_PORT:-3306}
export METASTORE_DB_TYPE=${METASTORE_DB_TYPE:-mysql}

echo "Waiting for database on ${METASTORE_DB_HOSTNAME} to launch on ${METASTORE_DB_PORT} ..."

while ! nc -z ${METASTORE_DB_HOSTNAME} ${METASTORE_DB_PORT}; do
  sleep 1
done

echo "Database on ${METASTORE_DB_HOSTNAME}:${METASTORE_DB_PORT} started"
echo "Init apache hive metastore on ${METASTORE_DB_HOSTNAME}:${METASTORE_DB_PORT}"

/opt/apache-hive-metastore-3.1.3-bin/bin/schematool -initSchema -dbType ${METASTORE_DB_TYPE}
/opt/apache-hive-metastore-3.1.3-bin/bin/start-metastore