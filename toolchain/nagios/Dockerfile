FROM ubuntu:focal
USER root
RUN \
  apt update && \
  apt upgrade && \
  DEBIAN_FRONTEND=noninteractive apt install -y \
    nagios4 \
    monitoring-plugins \
    nagios-nrpe-plugin
CMD /usr/sbin/nagios4 /etc/nagios4/nagios.cfg
