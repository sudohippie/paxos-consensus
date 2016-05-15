FROM ubuntu:14.04
MAINTAINER Raghav Sidhanti <@sudohippie>

ENV DEBIAN_FRONTEND noninteractive
ENV PAXOS_HOME=/opt/paxos

# update apt
RUN apt-get update && apt-get -y upgrade

# setup mysql
RUN apt-get install -y mysql-server
ADD scripts/docker/mysql/my.cnf /etc/mysql/conf.d/my.cnf
ADD scripts/sql $PAXOS_HOME/sql

# go
RUN apt-get install -y golang

# startup scripts
ADD scripts/docker/run.sh /run.sh
RUN chmod +x /run.sh

# working directory
WORKDIR $PAXOS_HOME

VOLUME ["/var/lib/mysql"]

# bootstrap
CMD ["/run.sh"]