FROM ubuntu:20.04

COPY setup.sh /opt/setup.sh

RUN /opt/setup.sh /usr/local/src
