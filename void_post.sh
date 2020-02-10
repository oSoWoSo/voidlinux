
#!/bin/bash
# Void Linux post-install script

#install basic
xbps-install -S
xbps-install libxbps xbps void-repo-nonfree void-repo-multilib void-repo-multilib-nonfree
xbps-install -Syu

#install vpm and vsv for manage packages and services
xbps-install -S vsv git
git clone git://github.com/zen0bit/vpm.git
cp vpm/vpm /usr/bin
#install editors
vpm i nano geany
#install browser
vpm i firefox
