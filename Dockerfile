FROM jess/firefox

RUN apt-get update && apt-get -y install pulseaudio

RUN apt-get install -y ttf-mscorefonts-installer
