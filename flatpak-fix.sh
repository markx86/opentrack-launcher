#!/bin/bash


echo "#!/bin/sh" > ~/.local/bin/7z
echo "/usr/bin/flatpak-spawn --host 7z \"\$@\"" >> ~/.local/bin/7z
chmod +x ~/.local/bin/7z

flatpak override --user --env=PATH="/app/bin:/app/utils/bin:/usr/bin:/home/$USER/.local/bin" --filesystem="/home/$USER/.local/bin" --filesystem="/home/$USER/.local/share" --socket=session-bus com.valvesoftware.Steam