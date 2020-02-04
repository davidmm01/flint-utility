FROM mysql:8

ENV MYSQL_USER=bob MYSQL_PASS=cool MYSQL_ROOT_PASSWORD=123

ADD schema.sql /docker-entrypoint-initdb.d

EXPOSE 3306
