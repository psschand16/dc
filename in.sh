#!/bin/bash

###	This file should be run in SUDO mode

### The script file needs to be executable, i.e.
#	chmod +x script.sh

#	Update package index
apt-get update -y
apt-get upgrade -y
echo "update sources..................."
sleep 4
echo "installing xrdp..gnome gdm3 session................."
# sudo adduser xrdp ssl-cert 
# sudo apt-get install xrdp -y
sudo apt install xrdp gnome-tweak-tool -y
echo " done  xrdp gnome-tweak-tool.............starting gnome gdm3....."
sleep 3
sudo usermod -a -G ssl-cert xrdp -y
sudo apt install gnome-session gdm3 -y
echo " done  gnome-session gdm3 .................."
sleep 3
sudo adduser xrdp ssl-cert -y
sudo usermod -a -G ssl-cert xrdp -y
echo " ............added certs .................."
sleep 3
echo "starting mate.................."
sleep 4
# sudo apt-get install xrdp -y
# sudo adduser xrdp ssl-cert
# sudo usermod -a -G ssl-cert xrdp 
sudo systemctl restart xrdp -y
sudo apt-add-repository ppa:ubuntu-mate-dev/ppa -y
sudo apt-add-repository ppa:ubuntu-mate-dev/trusty-mate -y
sudo apt-get update -y
sudo apt-get upgrade -y
echo "upaded  sources"
echo "installing mate.................."
sleep 4
sudo apt-get install xrdp -y
sudo apt-get install ubuntu-mate-core -y 
sudo apt-get install  ubuntu-mate-desktop -y 
echo mate-session >~/.xsession
sudo service xrdp restart

echo "enabling ufw............."
sleep 4
sudo ufw --force enable && sudo ufw allow 3389 && sudo ufw status 

#copy in the base lines for the file:
#NOTE lines 2-4 are there to kill the existing session if locally active on your login - so that xrdp can create the session

echo '#!/bin/sh' > /etc/xrdp/startwm.sh
echo unset DBUS_SESSION_BUS_ADDRESS >> /etc/xrdp/startwm.sh
echo unset XDG_RUNTIME_DIR >> /etc/xrdp/startwm.sh
echo . $HOME/.profile >> /etc/xrdp/startwm.sh
echo '' >> /etc/xrdp/startwm.sh
echo 'if [ -r /etc/default/locale ]; then' >> /etc/xrdp/startwm.sh
echo ' . /etc/default/locale' >> /etc/xrdp/startwm.sh
echo ' export LANG LANGUAGE' >> /etc/xrdp/startwm.sh
echo fi >> /etc/xrdp/startwm.sh
echo startxfce4 >> /etc/xrdp/startwm.sh
echo '' >> /etc/xrdp/startwm.sh
==============================
lsb_release -sd

sudo adduser om
sudo passwd ubuntu
ubuntu


sudo apt update -y
sudo apt install ne -y
touch in.sh

sudo nano /etc/xrdp/startwm.sh
In case you wish to upgrade MATE to the latest version, simply run the command below after updating your system:

$ sudo apt-get dist-upgrade

sudo apt-get install caja compiz-mate engrampa eom folder-color-caja gnome-accessibility-themes gnome-colors-common gnome-icon-theme gnome-orca grub2-themes-ubuntu-mate indicator-messages indicator-power indicator-session indicator-sound lightdm-gtk-greeter mate-accessibility-profiles mate-applet-appmenu mate-applet-brisk-menu mate-calc mate-desktop mate-dock-applet mate-hud mate-icon-theme mate-menu mate-menus mate-netbook mate-optimus mate-screensaver mate-screensaver-common mate-system-monitor mate-tweak mate-user-guide mate-utils mate-window-applets-common mate-window-buttons-applet mate-window-menu-applet mate-window-title-applet plank plymouth-theme-ubuntu-mate-logo plymouth-theme-ubuntu-mate-text sessioninstaller sound-theme-freedesktop tilda ubuntu-mate-artwork ubuntu-mate-core ubuntu-mate-default-settings ubuntu-mate-guide ubuntu-mate-icon-themes ubuntu-mate-lightdm-theme ubuntu-mate-themes ubuntu-mate-wallpapers* ubuntu-standard --no-install-recommends

---------------- On Ubuntu Linux ---------------- 
$ sudo apt-get remove ubuntu-mate-desktop ubuntu-mate-core  -y
$ sudo apt-get autoremove -y

#############################################################
sudo apt-get update  -y
sudo apt-get upgrade -y

echo "starting ufw......"

sudo ufw --force enable && sudo ufw allow 3389 && sudo ufw status 
sudo ufw reload
sudo ufw status

sudo apt-get install xrdp -y
sudo adduser xrdp ssl-cert

sudo apt-add-repository ppa:ubuntu-mate-dev/ppa -y
sudo apt-add-repository ppa:ubuntu-mate-dev/trusty-mate -y

echo "updating and upgrading again"
sudo apt-get update -y
sudo apt-get upgrade -y

sudo apt-get install xrdp -y

echo "starting mate core"
sudo apt-get install ubuntu-mate-core -y 

echo "starting mate desktop......"
sudo apt-get install ubuntu-mate-desktop -y 

echo mate-session >~/.xsession
sudo service xrdp restart
============

DEBIAN_FRONTEND=noninteractive apt-get install kde-plasma-desktop
echo "starting mate core"
sudo DEBIAN_FRONTEND=noninteractive apt-get install ubuntu-mate-core -y 

echo "starting mate desktop......"
sudo DEBIAN_FRONTEND=noninteractive apt-get install ubuntu-mate-desktop -y 
====================

sudo apt-get install ubuntu-mate-core -y
Package configuration

 ┌──────────────────────────────────────────────┤ Configuring lightdm ├───────────────────────────────────────────────┐
 │                                                                                                                    │ 
 │ A display manager is a program that provides graphical login capabilities for the X Window System.                   
 │                                                                                                                      
 │ Only one display manager can manage a given X server, but multiple display manager packages are installed. Please    
 │                                                                                                                      
 │                                                       <Ok>            



Package configuration
                                           ┌────┤ Configuring lightdm ├─────┐
                                           │ Default display manager:       │ 
                                           │                                │ 
                                           │            gdm3                │ 
                                           │            lightdm             │ 
                                           │                                │ 
                                           │                                │ 
                                           │             <Ok>               │ 
                                           │                                │ 
                                           └────────────────────────────────┘ 
                                                                              
