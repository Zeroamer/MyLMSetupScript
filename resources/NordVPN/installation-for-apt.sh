#!/bin/bash
sudo dpkg -i ./nordvpn-release_1.0.0_all.deb
sudo apt update && sudo apt install nordvpn
echo "Installed NordVPN, setting protocol to NordLynx"
nordvpn set technology nordlynx
echo "Type your NordVPN login credentials here:"
nordvpn c
echo "NordVPN is now connected, type \"nordvpn d\" to disconnect"

