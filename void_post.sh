
#!/bin/bash
# Void Linux post-install script

echo "						Starting Void Linux post-install script..."
sleep 1s

#install basic
xbps-install -S
xbps-install libxbps xbps void-repo-nonfree void-repo-multilib void-repo-multilib-nonfree

echo "						Updating system..."
sleep 1s
xbps-install -Syu

echo "						Installing drivers..."
sleep 1s
xbps-install nvidia ntfs-3g
echo "						installing vpm and vsv for manage packages and services"
sleep 1s
xbps-install vsv git
git clone git://github.com/zen0bit/vpm.git
cp vpm/vpm /usr/bin

echo "						installing editors"
sleep 1s
xbps-install nano geany

echo "						installing browser"
sleep 1s
#xbps-remove falkon
xbps-install firefox
echo "						Installing essentials"
sleep 1s
xbps-install xarchiver neofetch
echo "						Removing orphaned packages...."
sleep 1s
xbps-remove -Oo
clear
neofetch
echo "						Restart your computer and enjoy Void linux...."
