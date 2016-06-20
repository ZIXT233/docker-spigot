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

chown -R minecraft.minecraft /$SPIGOT_HOME/


cd /$SPIGOT_HOME/
su - minecraft -c "java $MINECRAFT_OPTS -jar paperclip.jar"
bash

