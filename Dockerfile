FROM jess/firefox

USER root
RUN adduser firefox
RUN gpasswd -a firefox audio
RUN apt-get update && apt-get -y install pulseaudio
USER firefox
