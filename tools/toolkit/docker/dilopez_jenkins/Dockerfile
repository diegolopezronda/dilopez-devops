FROM jenkins/jenkins:lts-jdk11
USER root 
RUN \ 
  apt-get update && \ 
  apt-get install -y docker build-essential vim git golang && \ 
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* 
RUN gpasswd -a jenkins staff
