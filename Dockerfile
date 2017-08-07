FROM 2chat/ubuntu:trusty
MAINTAINER Roma Gordeev <roma.gordeev@gmail.com>

## Remove any existing JDKs
RUN apt-get --purge remove openjdk*

## Install Oracle's JDK
# add oracle jdk repository
RUN add-apt-repository ppa:webupd8team/java \
# accept oracle license
  && echo debconf shared/accepted-oracle-license-v1-1 select true | sudo debconf-set-selections \
  && echo debconf shared/accepted-oracle-license-v1-1 seen true | sudo debconf-set-selections \
  && apt-get update \
# install oracle jdk 8 and make it default
  && apt-get -y install oracle-java8-installer \
  && apt-get -y install oracle-java8-set-default \
# clean up
  && apt-get clean all \
  && rm -rf /var/lib/apt/lists/*