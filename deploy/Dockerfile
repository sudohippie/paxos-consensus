FROM ubuntu:latest
MAINTAINER Raghav Sidhanti <@sudohippie>

ENV PAXOS_HOME=/opt/paxos

# update apt
RUN apt-get update && apt-get -y upgrade

# setup mysql
RUN apt-get install -y mysql-server
ADD mysql/my.cnf /etc/mysql/conf.d/my.cnf
ADD ../sql $PAXOS_HOME
VOLUME ["/var/lib/mysql"]

# go
RUN apt-get install -y golang

# git
RUN apt-get install -y git

# main script
ADD ./run.sh /sbin/run
RUN chmod +x /sbin/run

# bootstrap
ENTRYPOINT ["run"]