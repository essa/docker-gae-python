FROM ubuntu:12.04 
MAINTAINER Taku Nakajima <takunakajima@gmail.com>

ENV SDKURL http://googleappengine.googlecode.com/files/google_appengine_1.8.8.zip
ENV USER gae
ENV PASSWORD python
ENV ROOTPASSWORD root-defaultpass

# Run upgrades
RUN echo deb http://us.archive.ubuntu.com/ubuntu/ precise universe multiverse >> /etc/apt/sources.list;\
  echo deb http://us.archive.ubuntu.com/ubuntu/ precise-updates main restricted universe >> /etc/apt/sources.list;\
  echo deb http://security.ubuntu.com/ubuntu precise-security main restricted universe >> /etc/apt/sources.list;\
  echo udev hold | dpkg --set-selections;\
  echo initscripts hold | dpkg --set-selections;\
  echo upstart hold | dpkg --set-selections;\
  apt-get update;\
  apt-get -y upgrade

# Install ssh

RUN apt-get install -y openssh-server && mkdir /var/run/sshd 
RUN echo "root:${ROOTPASSWORD}" |chpasswd

# Install Additional packages and dependancies

RUN apt-get install -y sudo lv w3m wget curl zip git vim build-essential zlib1g-dev libyaml-dev libssl-dev libgdbm-dev libreadline-dev libncurses5-dev libffi-dev checkinstall libxml2-dev libxslt-dev libcurl4-openssl-dev libicu-dev  libfontconfig1

# Install popular python packages

RUN apt-get install -y python2.7 python-pyquery python-nose python-webtest python-pip python-docutils python-software-properties
RUN pip install NoseGAE mock

# Install Google AppEngine for python SDK

ADD $SDKURL /tmp/gae.zip
RUN cd /usr/local && unzip /tmp/gae.zip
RUN ln -s /usr/local/google_appengine/dev_appserver.py /usr/local/bin && ln -s /usr/local/google_appengine/appcfg.py /usr/local/bin

# Add user

RUN useradd $USER && adduser $USER sudo && echo "${USER}:${PASSWORD}" |chpasswd && mkdir /home/$USER && chown -R $USER /home/$USER && chsh -s /bin/bash $USER

EXPOSE 22
CMD    /usr/sbin/sshd -D

