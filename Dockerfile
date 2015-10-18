
FROM ubuntu:14.04

MAINTAINER Kym Eden

RUN apt-get update && apt-get dist-upgrade -y 

RUN apt-get install -y git build-essential autoconf libtool libudev-dev zlib1g-dev python2.7-dev python-pip 

RUN apt-get install -y python-gtk2-dev python-rsvg python-virtkey libjpeg-dev python-dbus python-lxml python-xdg python-gconf python-xlib 

RUN git clone https://github.com/CMoH/gnome15.git /home/app/gnome15

WORKDIR /home/app/gnome15

ADD pip-require ./pip-require

RUN pip install --pre -r pip-require

RUN autoreconf --install && ./configure && make && make check 

RUN make install && make installcheck

ENTRYPOINT ["/bin/bash"]
