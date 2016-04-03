FROM nimmis/java:openjdk-8-jdk

MAINTAINER ZIXT233 <zixt233@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

ENV SPIGOT_HOME /minecraft
ENV JAVA_XMX 1G
ENV JAVA_XMS 1G
ENV JAVA_PERMSIZE 450m
ADD spigot_init.sh /spigot_init.sh
ADD PaperSpigot-1.8.8-R0.1-SNAPSHOT-latest.jar /spigot.jar
RUN chmod +x /spigot_init.sh

RUN apt-get update && apt-get install -y wget git && apt-get clean all

RUN useradd -s /bin/bash -d /minecraft -m minecraft
VOLUME ["$SPIGOT_HOME"]
EXPOSE 25565

CMD /spigot_init.sh

