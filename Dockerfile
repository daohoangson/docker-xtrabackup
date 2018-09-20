FROM debian:stretch

ARG DEBIAN_FRONTEND=noninteractive
ENV PERCONA_XTRABACKUP_VERSION 2.4.12-1.stretch

RUN set -e; \
  apt-get update; \
  apt-get install --no-install-recommends --yes \
    apt-transport-https \
    apt-utils \
    ca-certificates \
    gnupg1 \
  ; \
  apt-key adv --keyserver keys.gnupg.net --recv-keys 9334A25F8507EFA5; \
  echo 'deb https://repo.percona.com/apt stretch main' > /etc/apt/sources.list.d/percona.list; \
  apt-get update \
    -o Dir::Etc::sourcelist='/etc/apt/sources.list.d/percona.list' \
    -o Dir::Etc::sourceparts='-' \
    -o APT::Get::List-Cleanup='0'; \
  apt-get install --no-install-recommends --yes \
    percona-xtrabackup-24=${PERCONA_XTRABACKUP_VERSION} \
    qpress \
  ; \
  rm -rf /var/lib/apt/lists/*

VOLUME ["/etc/mysql", "/var/run/mysqld", "/var/lib/mysql", "/xtrabackup_backupfiles"]

COPY docker-entrypoint.sh /usr/local/bin/
ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["xtrabackup"]
