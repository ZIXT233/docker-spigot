#!/bin/bash
if [ "$EULA" != "true" ]; then
  echo "*****************************************************************"
  echo "*****************************************************************"
  echo "** To be able to run spigot you need to accept minecrafts EULA **"
  echo "** see https://account.mojang.com/documents/minecraft_eula     **"
  echo "** include -e EULA=true on the docker run command              **"
  echo "*****************************************************************"
  echo "*****************************************************************"
  exit
fi

#only build if jar file does not exist
if [ ! -f /$SPIGOT_HOME/spigot.jar ]; then 
  echo "Building spigot jar file, be patient"
  cd /$SPIGOT_HOME/
  mv /spigot.jar /$SPIGOT_HOME/

  #accept eola
  echo "eula=true" > /$SPIGOT_HOME/eula.txt

fi

chown -R minecraft.minecraft /$SPIGOT_HOME/


cd /$SPIGOT_HOME/
su - minecraft -c "java $MINECRAFT_OPTS -jar spigot.jar"
bash

