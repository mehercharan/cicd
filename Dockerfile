
# Pull base image.
FROM ubuntu:14.04
ARG DEBIAN_FRONTEND=noninteractive
# Install Java.
RUN apt-get update \
    && apt-get install -y \
    git-core \
    build-essential \
    gperf \
    && apt-get clean \
    #&& rm -rf /var/lib/apt/lists/*


RUN apt-get install -y software-properties-common \
    && add-apt-repository ppa:maxmind/ppa \
    && apt-get update \
    && apt-get install libmaxminddb0 libmaxminddb-dev mmdb-bin
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install software-properties-common
RUN \
  sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get install -y build-essential && \
  apt-get install -y software-properties-common && \
  apt-get install -y byobu curl git htop man unzip vim wget && \
  rm -rf /var/lib/apt/lists/*
RUN add-apt-repository ppa:webupd8team/java && apt-get update && apt-get install oracle-java8-installer


# Define working directory.
WORKDIR /data

# Define commonly used JAVA_HOME variable
ENV JAVA_HOME /usr/lib/jvm/java-8-oracle

# Define default command.
CMD ["bash"]



