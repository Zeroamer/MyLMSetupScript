#!/bin/bash

sudo printf "Upgrading system...\n"
sudo apt update && sudo apt upgrade

printf "\nInstalling dependencies...\n"
sudo apt install -y git
sudo apt install -y flatpak
sudo apt install -y unzip
sudo apt install -y python
sudo apt install -y python3-pip
sudo apt install -y openjdk-14-jre openjdk-8-jdk
sudo apt install -y openjdk-8-jre openjdk-8-jdk

printf "\nInstalling Vivaldi (Snapshot)...\n"
wget -qO- https://repo.vivaldi.com/archive/linux_signing_key.pub | sudo apt-key add -
sudo add-apt-repository -y 'deb https://repo.vivaldi.com/archive/deb/ stable main'
sudo apt update && sudo apt install -y vivaldi-snapshot

printf "\nInstalling htop...\n"
sudo apt install -y htop

printf "\nInstalling XDoTool...\n"
sudo apt install -y xdotool

printf "\nInstalling TLP...\n"
sudo apt install -y tlp
sudo tlp start

printf "\nInstalling OBS Studio...\n"
sudo apt install -y obs-studio

printf "\nInstalling CopyQ...\n"
sudo apt install -y copyq

printf "\nInstalling Flameshot...\n"
sudo apt install -y flameshot

printf "\nInstalling Steam...\n"
sudo apt install -y steam

printf "\nInstalling Grub Customizer...\n"
sudo apt install -y grub-customizer

printf "\nInstalling DConf Editor...\n"
sudo apt install -y dconf-editor

printf "\nInstalling GIMP...\n"
sudo apt install -y gimp

printf "\nInstalling FFmpeg...\n"
sudo apt install -y ffmpeg

printf "\nInstalling youtube-dl...\n"
pip3 install youtube-dl

printf "\nInstalling Minecraft Launcher...\n"
sudo apt install -y minecraft-launcher

printf "\nInstalling Webcamoid...\n"
sudo apt install -y webcamoid

printf "\nInstalling Download Managers (Aria2, uGet)...\n"
sudo apt install -y aria2
sudo add-apt-repository ppa:uget-team/ppa
sudo apt update && sudo apt install -y uget

printf "\nInstalling System Maintenance Apps (BleachBit, Stacer)...\n"
sudo apt install -y bleachbit
sudo apt install -y stacer

printf "\nInstalling Wine & Winetricks...\n"
sudo apt install -y wine
sudo apt install -y winetricks

printf "\nInstalling WireGuard VPN (and dependencies)...\n"
sudo apt install -y wireguard
sudo apt install -y resolvconf

printf "\nInstalling qBitTorrent...\n"
sudo add-apt-repository -y ppa:qbittorrent-team/qbittorrent-stable
sudo apt update && sudo apt install -y qbittorrent

printf "\nInstalling Tor Browser Launcher...\n"
sudo add-apt-repository -y universe && sudo apt update
sudo apt install -y torbrowser-launcher

printf "\nInstalling Zoom (Flatpak)...\n"
sudo flatpak install zoom
sudo flatpak override us.Zoom.zoom --filesystem=~/Documents/Zoom

printf "\nInstalling Telegram (Flatpak)...\n"
sudo flatpak install telegram

printf "\nInstalling PeaZip (Flatpak)...\n"
sudo flatpak install peazip

printf "\nInstalling Master PDF Editor...\n"
sudo dpkg -i ./resources/MasterPDFEditor/master-pdf-editor-5.6.49-qt5.x86_64.deb

printf "\nInstalling ideapad-cm (Ideapad Conservation Mode)\n"
sudo cp ./resources/ideapad-cm/ideapad-cm /usr/bin/
sudo chmod +x /usr/bin/ideapad-cm

printf "\nInstalling Simplenote...\n"
mkdir ./resources/Simplenote/
wget -c https://github.com/Automattic/simplenote-electron/releases/download/v2.1.0/Simplenote-linux-2.1.0-amd64.deb && mv Simplenote-linux-2.1.0-amd64.deb ./resources/Simplenote/
sudo dpkg -i ./resources/Simplenote/Simplenote-linux-2.1.0-amd64.deb

printf "\nInstalling Stremio...\n"
mkdir ./resources/Stremio
wget https://dl.strem.io/shell-linux/v4.4.137/stremio_4.4.137-1_amd64.deb && mv stremio_4.4.137-1_amd64.deb ./resources/Stremio/stremio_4.4.137-1_amd64.deb
sudo dpkg -i ./resources/Stremio/stremio_4.4.137-1_amd64.deb && sudo dpkg -i ./resources/StremioFix/libx264-152_0.152.2854+gite9a5903-2_amd64.deb

printf "\nInstalling Popcorn Time...\n"
sudo apt install -y libcanberra-gtk-module libgconf-2-4
mkdir ./resources/PopcornTime
wget -c https://get.popcorntime.app/repo/build/Popcorn-Time-0.4.4-linux64.zip && mv Popcorn-Time-0.4.4-linux64.zip ./resources/PopcornTime/
sudo mkdir /opt/popcorntime && sudo unzip ./resources/PopcornTime/Popcorn-Time-0.4.4-linux64.zip -d /opt/popcorntime/
sudo ln -sf /opt/popcorntime/Popcorn-Time /usr/bin/Popcorn-Time
sudo touch /usr/share/applications/popcorntime.desktop
sudo su -c 'echo "[Desktop Entry]" >> /usr/share/applications/popcorntime.desktop'
sudo su -c 'echo "Version = 1.0" >> /usr/share/applications/popcorntime.desktop'
sudo su -c 'echo "Type = Application" >> /usr/share/applications/popcorntime.desktop'
sudo su -c 'echo "Terminal = false" >> /usr/share/applications/popcorntime.desktop'
sudo su -c 'echo "Name = Popcorn Time" >> /usr/share/applications/popcorntime.desktop'
sudo su -c 'echo "Exec = /usr/bin/Popcorn-Time" >> /usr/share/applications/popcorntime.desktop'
sudo su -c 'echo "Icon = /opt/popcorntime/popcorn.png" >> /usr/share/applications/popcorntime.desktop'
sudo su -c 'echo "Categories = Application;" >> /usr/share/applications/popcorntime.desktop'
sudo wget -O /opt/popcorntime/popcorn.png https://upload.wikimedia.org/wikipedia/commons/d/df/Pctlogo.png

printf "\nInstalling Vimix GTK Themes...\n"
git clone https://github.com/vinceliuice/vimix-gtk-themes ./resources/vimix-gtk-themes
chmod +x ./resources/vimix-gtk-themes/./install.sh
sudo ./resources/vimix-gtk-themes/./install.sh

printf "\n\nInstalling zsh and configuring oh-my-zsh...\n"
sudo apt install -y zsh
printf "\n Setting zsh as default shell...\n"
read -p "What is your username?: " $username
printf "\nSwitching shell to zsh...\n"
chsh /usr/bin/zsh $username
printf "\nInstalling oh-my-zsh...\n"
sh ./resources/oh-my-zsh/install.sh

printf "\nInstalling powerlevel10k theme for oh-my-zsh...\n"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

printf "\nCopying custom '.zshrc' file...\n"
sudo cp ./resources/zshrc/zshrc ~/.zshrc

printf "\nAdding Windows 2000 startup sound to options...\n"
sudo mv ./resources/Windows2000Startup/win2k-startup.ogg /usr/share/mint-artwork/sounds/win2k-startup.ogg

printf "\nInstalling additional cursors...\n"
sudo unzip ./resources/Cursors/BreezeCursors.zip -d /usr/share/icons/
sudo unzip ./resources/Cursors/CapitaineCursors.zip -d /usr/share/icons/
sudo unzip ./resources/Cursors/QogirCursors.zip -d /usr/share/icons/
sudo unzip ./resources/Cursors/SpaceKCursors.zip -d /usr/share/icons/
sudo unzip ./resources/Cursors/VimixCursors.zip -d /usr/share/icons/
sudo unzip ./resources/Cursors/VolantesCursors.zip -d /usr/share/icons/
sudo unzip ./resources/Cursors/WinConceptOSCursors.zip -d /usr/share/icons/
sudo unzip ./resources/Cursors/WinSurDarkCursors.zip -d /usr/share/icons/

printf "\nAdding additional wallpapers...\n"
sudo mkdir /usr/share/backgrounds/custom
sudo mv ./resources/Wallpapers/* /usr/share/backgrounds/custom

printf "\n\n\nCleaning up..."
sudo apt update && sudo apt upgrade
sudo apt autoclean && sudo apt clean
sudo apt remove && sudo apt autoremove
