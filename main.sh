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
~
~
~
~
~
