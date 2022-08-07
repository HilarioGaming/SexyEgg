#!/bin/bash

function display {

    #Clear Console
    echo -e "\033c"

    #Display MOTD
    echo "
    ==========================================================================            
    $(tput setaf 6)                            __  .__                         .___             
    $(tput setaf 6)_____    ________ _______ _/  |_|__| ____   ____   ____   __| _/____   ______
    $(tput setaf 6)\__  \  / ____/  |  \__  \\   __\  |/ ___\ /    \ /  _ \ / __ |/ __ \ /  ___/   
    $(tput setaf 6) / __ \< <_|  |  |  // __ \|  | |  \  \___|   |  (  <_> ) /_/ \  ___/ \___ \  
    $(tput setaf 6)(____  /\__   |____/(____  /__| |__|\___  >___|  /\____/\____ |\___  >____  >   
    $(tput setaf 6)     \/    |__|          \/             \/     \/            \/    \/     \/    
    ==========================================================================
    "  
}

function forceStuffs {
  # Forcing Default Server Icon.
  curl -O https://media.discordapp.net/attachments/919461094433644644/1005004318329544754/server-icon.png

  # Forcing Hibernate Plugin.
  curl -o plugins/ServerNaptime.jar https://cdn.discordapp.com/attachments/1003135566503743558/1005043790240817182/ServerNaptime.jar

  # Forcing MOTD.
  echo "motd=\u00a7fThis server is hosted on \u00a79aquaticnodes.host\u00a7r\n\u00a77You can change this MOTD in server.properties" >> server.properties
}

function launchJavaServer {
  # Using Aikars flags.
  java -Xms1024M -XX:+UseG1GC -XX:+ParallelRefProcEnabled -XX:MaxGCPauseMillis=200 -XX:+UnlockExperimentalVMOptions -XX:+DisableExplicitGC -XX:G1NewSizePercent=30 -XX:G1MaxNewSizePercent=40 -XX:G1HeapRegionSize=8M -XX:G1ReservePercent=20 -XX:G1HeapWastePercent=5 -XX:G1MixedGCCountTarget=4 -XX:InitiatingHeapOccupancyPercent=15 -XX:G1MixedGCLiveThresholdPercent=90 -XX:G1RSetUpdatingPauseTimePercent=5 -XX:SurvivorRatio=32 -XX:+PerfDisableSharedMem -XX:MaxTenuringThreshold=1 -Dusing.aikars.flags=https://mcflags.emc.gs -Daikars.new.flags=true -jar paper-server.jar nogui
}
FILE=eula.txt

# Currently this is still in development.

function optimizeJavaServer {
  # Decreasing view distance.
  echo "view-distance=6" >> server.properties

  # Slows down incremental chunk saving during the world save task
  # echo "max-auto-save-chunks-per-tick: 10" >> paper.yml
  
  # Optimize explosions.
  # echo "optimize-explosions: true" >> paper.yml
  
  # Disable overload warnings
  # echo "warn-on-overload: false" >> spigot.yml

  # Prevents players from entering an unloaded chunk (due to lag), which causes more lag.
  # echo "prevent-moving-into-unloaded-chunks: true" >> paper.yml
  
}

if [[ -f bedrock_server ]]; then
    ./bedrock_server
fi

# Check if the node IP is matched.
IP=$(curl -s https://checkip.amazonaws.com)
if [ ! "$IP" = 20.205.38.247 ] && [ ! "$IP" = 20.198.120.116 ] && [ ! "$IP" = 52.187.23.163 ]
then
    display
    echo "$(tput setaf 1)Looks like you tried making bedrock server in non-asia nodes lmao"
else

if [ ! -f "$FILE" ]
then
    mkdir -p plugins
    display
echo "
  $(tput setaf 1)Made By ewn#9981 & fate#0993
  $(tput setaf 3)What Server Software you goin to use lmao
  1)  Bedrock Latest
  2)  Pocketmine MP
  "
  echo "$(tput setaf 1)RESTART YOUR SERVER IF YOU HAVE A SERVER SOFTWARE ALREADY INSTALLED AND THIS APPEARED AGAIN."
  
read -r n

# I was uploading all the server jars to Discord because I was in hurry for vacation lol, will do a complete recode soon.
case $n in
  1) 
    echo ""
    echo -e "\n Downloading ${BEDROCK_VERSION} Bedrock server"
    
    curl -O https://cdn.discordapp.com/attachments/957271452757921842/1005352761069678622/bedrock.tar.gz
    
    tar -xzvf bedrock.tar.gz
    
    rm -r bedrock.tar.gz

    echo -e "Install Completed"

    display

    launchBedrockServer
  ;;

  2) 
    echo ""
    echo "This Software isn't available yet, please check back later. (COMING_SOON)"
    exit
  ;;

  *) 
    echo "Invalid option, exiting.."
    exit
  ;;
esac  
else
if [ -f plugins ]; then
mkdir plugins
fi
if [ -f "BungeeCord.jar" ]; then
  display
  java -Xms512M -Xmx512M -jar BungeeCord.jar
fi
if [ ! -f hA5AW4Ni6Si6S4WvZ4WvZhA5AW4N.png ]; then
# Force the server icon.
curl -O https://media.discordapp.net/attachments/919461094433644644/1005004318329544754/server-icon.png
fi
if [ -d plugins ]; then
  mkdir -p plugins
fi
# Redownload the Hibernate jar incase someone delete it.
  curl -o plugins/aquaticnodes.jar https://cdn.discordapp.com/attachments/1003135566503743558/1005043790240817182/ServerNaptime.jar
  display   
  launchJavaServer
fi
fi
