#!/bin/sh

mkdir -p ~/.var/app/com.valvesoftware.Steam/bin
wget https://raw.githubusercontent.com/VolatileMark/opentrack-launcher/master/opentrack-launcher -O ~/.var/app/com.valvesoftware.Steam/bin/opentrack-launcher
echo '#!/bin/sh' > ~/.var/app/com.valvesoftware.Steam/bin/7z
echo 'PARAMS=$(echo "$@" | sed "s_/home/"$USER"/.local_/home/"$USER"/.var/app/com.valvesoftware.Steam/.local_g")' >> ~/.var/app/com.valvesoftware.Steam/bin/7z
echo '/usr/bin/flatpak-spawn --host 7z $PARAMS' >> ~/.var/app/com.valvesoftware.Steam/bin/7z
chmod +x ~/.var/app/com.valvesoftware.Steam/bin/7z ~/.var/app/com.valvesoftware.Steam/bin/opentrack-launcher
flatpak override --user --env=PATH="/app/bin:/app/utils/bin:/usr/bin:/home/$USER/.var/app/com.valvesoftware.Steam/bin" --socket=session-bus com.valvesoftware.Steam