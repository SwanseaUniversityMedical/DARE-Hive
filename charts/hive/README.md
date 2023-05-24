# <img src="https://hive.apache.org/images/hive_logo_medium.jpg" width="10%"> | HMS Helm Chart 

Metastore is the central repository of Apache Hive metadata. It stores metadata for Hive tables (like their schema and location) and partitions in a relational database. It provides client access to this information by using metastore service API.

## Hive Metastore Helm Chart

The important configuration in the Hive Metastore is metastore-site.xml configuration file.

This configuration file allows us to configure database and MinIO as a s3 like storage.

On the <b>hive-metastore</b> helm chart, we pass:
- <b>MariaDB</b> configuration
- <b>MinIO</b> configuration

On the default values.yaml file, as you can see, we are passing database values to <b>MariaDB</b> subchart with below configuration block. Also on the [templates/configmap.yaml](https://github.com/SwanseaUniversityMedical/SeRP-Trino/blob/main/charts/hive-metastore/templates/configmap.yaml) file, we are getting configurations from the same block.

```
mariadb:
  auth:
    rootPassword: admin
    database: metastore_db
    username: admin
    password: admin
```

The Hive connector can read and write tables that are stored in Amazon S3 or S3-compatible systems. This is accomplished by having a table or database location that uses an S3 prefix.

For this reason we should put s3 like server access configurations into <b>metastore-site.xml</b> configuration file.

```
minio:
  accessKey: console
  secretKey: console123
  endpoint: http://minio
```

<b>Note:</b> MinIO configuration should contains same values like Trino settings.
