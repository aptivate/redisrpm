FROM centosruby

ARG VERSION

RUN yum -y update
RUN yum -y upgrade
RUN gem install fpm

COPY rpmify .

RUN ./rpmify $VERSION

RUN rpm -qpi ./redis-*.rpm
RUN rpm -qpR ./redis-*.rpm
RUN rpm -qpl ./redis-*.rpm
