FROM centos:7

ARG VERSION

RUN yum -y update && yum -y upgrade
RUN yum install -y ruby ruby-devel gcc make rpm-build rubygems git wget tcl
RUN gem install --no-ri --no-rdoc fpm

COPY rpmify .

RUN ./rpmify $VERSION

RUN rpm -qpi ./redis-*.rpm
RUN rpm -qpR ./redis-*.rpm
RUN rpm -qpl ./redis-*.rpm
