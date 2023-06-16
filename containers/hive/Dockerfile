FROM apache/hive:3.1.3

LABEL org.opencontainers.image.source=https://github.com/SwanseaUniversityMedical/DARE-Hive

ENV SERVICE_NAME=metastore
ENV DB_DRIVER=postgres

COPY entrypoint.sh /

ENTRYPOINT ["sh" "-c" "/entrypoint.sh"]