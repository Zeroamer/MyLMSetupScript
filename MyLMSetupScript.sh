#!/bin/bash

sudo /bin/false

printf "Upgrading system...\n"
sudo apt update && sudo apt upgrade

printf "\nInstalling dependencies...\n"
sudo apt install git
sudo apt install flatpak
sudo apt install unzip
sudo apt install openjdk-14-jre openjdk-8-jdk
sudo apt install openjdk-8-jre openjdk-8-jdk

printf "\nInstalling Vivaldi (Snapshot)...\n"
wget -qO- https://repo.vivaldi.com/archive/linux_signing_key.pub | sudo apt-key add -
sudo add-apt-repository 'deb https://repo.vivaldi.com/archive/deb/ stable main'
sudo apt update && sudo apt install vivaldi-snapshot

printf "\nInstalling PeaZip...\n"
sudo apt install peazip

printf "\nInstalling OBS Studio...\n"
sudo apt install obs-studio

printf "\nInstalling CopyQ...\n"
sudo apt install copyq

printf "\nInstalling Flameshot...\n"
sudo apt install flameshot

printf "\nInstalling Steam...\n"
sudo apt install steam

printf "\nInstalling Grub Customizer...\n"
sudo apt install grub-customizer

printf "\nInstalling DConf Editor...\n"
sudo apt install dconf-editor

printf "\nInstalling GIMP...\n"
sudo apt install gimp

printf "\nInstalling WhatsApp (Electron)...\n"
sudo apt install whatsapp-desktop

printf "\nInstalling FFmpeg...\n"
sudo apt install ffmpeg

printf "\nInstalling youtube-dl...\n"
sudo apt install youtube-dl

printf "\nInstalling Download Managers (Aria2, uGet)...\n"
sudo apt install aria2
sudo add-apt-repository ppa:plushuang-tw/uget-stable
sudo apt update && sudo apt install uget

printf "\nInstalling System Maintenance Apps (BleachBit, Stacer)...\n"
sudo apt install bleachbit
sudo apt install stacer

printf "\nInstalling qBitTorrent...\n"
ppa:qbittorrent-team/qbittorrent-stable
sudo apt update && sudo apt install qbittorrent

printf "\nInstalling Stremio...\n"
sudo apt install stremio
sudo dpkg -i ./resources/StremioFix/libx264-152_0.152.2854+gite9a5903-2_amd64.deb

printf "\nInstalling Discord from Flatpak...\n"
sudo flatpak install discord

printf "\nInstalling Master PDF Editor...\n"
sudo dpkg -i ./resources/MasterPDFEditor/master-pdf-editor-5.6.49-qt5.x86_64.deb

printf "\nInstalling NordVPN...\n"
sudo dpkg -i ./resources/NordVPN/nordvpn-release_1.0.0_all.deb
sudo apt update
./resources/NordVPN/./installation-for-apt.sh

printf "\nInstalling Popcorn Time...\n"
sudo apt install libcanberra-gtk-module libgconf-2-4
sudo wget -c https://get.popcorntime.app/repo/build/Popcorn-Time-0.4.4-linux64.zip && sudo mv Popcorn-Time-0.4.4-linux64.zip ./resources/PopcornTime/
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
sudo apt install zsh
printf "\n Setting zsh as default shell...\n"
read -p "What is your username?: " $username
printf "\nSwitching shell to zsh...\n"
chsh /usr/bin/zsh $username
printf "\nInstalling oh-my-zsh...\n"
sh ./resources/oh-my-zsh/install.sh

printf "\nInstalling powerlevel10k theme for oh-my-zsh...\n"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
printf "\n\nTo set zsh theme to p10k, edit the ~/.zshrc file and make ZSH_THEME=powerlevel10k/powerlevel10k\n"

printf "\nAdding Windows 2000 startup sound to options...\n"
sudo mv ./resources/Windows2000Startup/win2k-startup.ogg /usr/share/mint-artwork/sounds/win2k-startup.ogg

printf "\nInstalling additional cursors...\n"
sudo unzip ./resources/Cursors/BreezeCursors.tar.gz /usr/share/icons/
sudo unzip ./resources/Cursors/CapitaineCursors.tar.gz /usr/share/icons/
sudo unzip ./resources/Cursors/QogirCursors.tar.xz /usr/share/icons/
sudo unzip ./resources/Cursors/SpaceKCursors.tar.gz /usr/share/icons/
sudo unzip ./resources/Cursors/VimixCursors.tar.xz /usr/share/icons/
sudo unzip ./resources/Cursors/VolantesCursors.tar.gz /usr/share/icons/
sudo unzip ./resources/Cursors/WinConceptOSCursors.tar.gz /usr/share/icons/
sudo unzip ./resources/Cursors/WinSurDarkCursors.tar.gz /usr/share/icons/

printf "\nAdding additional wallpapers...\n"
sudo mkdir /usr/share/backgrounds/custom
sudo mv ./resources/Wallpapers/* /usr/share/backgrounds/custom

printf "\n\n\nCleaning up..."
sudo apt autoclean && sudo apt clean
sudo apt remove && sudo apt autoremove
