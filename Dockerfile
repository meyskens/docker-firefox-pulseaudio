FROM jess/firefox

RUN apt-get update && apt-get -y install pulseaudio
