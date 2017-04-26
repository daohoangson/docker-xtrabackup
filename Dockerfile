FROM debian:jessie

RUN apt-get update \
	&& apt-get install -y --no-install-recommends apt-transport-https ca-certificates \
	&& echo 'deb https://repo.percona.com/apt jessie main' > /etc/apt/sources.list.d/percona.list \
	&& apt-get update \
	&& apt-get install -y --no-install-recommends --force-yes percona-xtrabackup-24 \
	&& rm -rf /var/lib/apt/lists/*

VOLUME ["/etc/mysql", "/var/run/mysqld", "/var/lib/mysql", "/xtrabackup_backupfiles"]

COPY docker-entrypoint.sh /usr/local/bin/
ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["xtrabackup"]
