FROM 2chat/ubuntu:xenial
MAINTAINER Roma Gordeev <roma.gordeev@gmail.com>

# install ffmpeg
RUN add-apt-repository ppa:jonathonf/ffmpeg-3 \
  && apt-get update \
  && apt-get install -y ffmpeg libav-tools x264 x265

## Install Oracle's JDK
# add oracle jdk repository
RUN add-apt-repository ppa:webupd8team/java \
# accept oracle license
  && echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections \
  && echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections \
  && apt-get update \
# install oracle jdk 8 and make it default
  && apt-get -y install oracle-java8-installer \
  && apt-get -y install oracle-java8-set-default \
# clean up
  && apt-get clean all \
  && rm -rf /var/lib/apt/lists/*
