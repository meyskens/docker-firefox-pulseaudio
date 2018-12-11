# Based on https://github.com/jessfraz/dockerfiles/blob/master/firefox/Dockerfile

FROM ubuntu:xenial

RUN apt-get update && apt-get install -y \
	dirmngr \
	gnupg \
	--no-install-recommends \
	&& apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 0AB215679C571D1C8325275B9BDB3D89CE49EC21 \
	&& echo "deb http://ppa.launchpad.net/mozillateam/firefox-next/ubuntu xenial main" >> /etc/apt/sources.list.d/firefox.list \
	&& apt-get update && apt-get install -y \
	ca-certificates \
	firefox \
	hicolor-icon-theme \
	libasound2 \
	libgl1-mesa-dri \
	libgl1-mesa-glx \
    apt-transport-https \
	--no-install-recommends \
    && apt-get -y install pulseaudio ffmpeg \
	&& rm -rf /var/lib/apt/lists/*

#RUN echo "deb http://deb.debian.org/debian sid contrib non-free" >>/etc/apt/sources.list
 RUN echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula \
    select true | debconf-set-selections
RUN apt-get update && apt-get install -y ttf-mscorefonts-installer

RUN add-apt-repository -y ppa:mc3man/trusty-media &&\
    apt-get update &&\
    apt-get install -y gstreamer0.10-ffmpeg

ENTRYPOINT [ "/usr/bin/firefox" ]
