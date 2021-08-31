FROM ubuntu:focal
USER root 
RUN apt update && apt upgrade && apt install -y nagios4 nagios-plugins nagios-nrpe-plugin
EXPOSE 80
CMD [ "/usr/local/bin/start_nagios" ]
