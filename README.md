# Opentrack Launcher

A script to launch the Windows version of opentrack along with a steam game/app in the same prefix and with the same proton version.

## Dependencies

- **p7zip** needed for `7z` command
- **python3** needed for the launcher

## Usage

**NOTE**: If you use flapak follow [these](#with-steam-flatpak) instructions.

Open a terminal and copy paste the following command to install it:

```bash
# Root option: easier but discouraged
$ sudo wget https://raw.githubusercontent.com/VolatileMark/opentrack-launcher/master/opentrack-launcher -O /usr/local/bin/opentrack-launcher && sudo chmod +x /usr/local/bin/opentrack-launcher

# Non-root option: not as easy but recommended
$ mkdir -p ~/.local/bin && wget https://raw.githubusercontent.com/VolatileMark/opentrack-launcher/master/opentrack-launcher -O ~/.local/bin/opentrack-launcher && chmod +x ~/.local/bin/opentrack-launcher
```

Then in Steam, right-click the game you want to use opentrack with, click on `Properties` and in the `LAUNCH OPTIONS` field, depending on how you installed the script, type one of the following commands:

```bash
# If you installed the script with the root option:
opentrack-launcher %command%

# If you installed the script with the non-root option:
/home/<your-username>/.local/bin/opentrack-launcher %command%
```

The first time you run the game with the launcher it might take a while, since it will download the latest version of opentrack and generate the launch script for the game.

### With Steam Flatpak

Download the script `flatpak-install.sh` and run it or open a terminal and run the following commands.

```bash
$ mkdir -p ~/.var/app/com.valvesoftware.Steam/bin
$ wget https://raw.githubusercontent.com/VolatileMark/opentrack-launcher/master/opentrack-launcher -O ~/.var/app/com.valvesoftware.Steam/bin/opentrack-launcher
$ echo '#!/bin/sh' > ~/.var/app/com.valvesoftware.Steam/bin/7z
$ echo '/usr/bin/flatpak-spawn --host 7z $@' >> ~/.var/app/com.valvesoftware.Steam/bin/7z
$ chmod +x ~/.var/app/com.valvesoftware.Steam/bin/7z ~/.var/app/com.valvesoftware.Steam/bin/opentrack-launcher
$ flatpak override --user --env=PATH="/app/bin:/app/utils/bin:/usr/bin:/home/$USER/.var/app/com.valvesoftware.Steam/bin" --socket=session-bus com.valvesoftware.Steam
```

The `LAUNCH OPTIONS` string is the same as the one for the root install:

```bash
# Launch options for Steam flatpak
opentrack-launcher %command%
```

## Folders

The launcher creates a the following folder structure in your `~/.local/share` (or `~/.var/app/com.valvesoftware.Steam/.local/share` if you're using the flatpak version of Steam):

```bash
./opentrack-launcher
├── install         # opentrack portable Windows version install folder
├── scripts         # launch scripts (.bat files) for each game
└── version.txt     # stores the current installed version of opentrack (used for auto-updating opentrack)
```
