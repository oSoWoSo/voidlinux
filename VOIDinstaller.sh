#!/bin/bash
# Void Linux post-install script

basic=(
  void-repo-nonfree
  void-repo-multilib
  void-repo-multilib-nonfree
  wget
  cmake
  acpi
  tlp
  emacs-x11
  redshift
  nvidia
  nvidia-libs-32bit
  nano
  xtools
  git
  firefox
  steam
  libdrm-32bit
  alsa-utils
  #alsa-tools
  sox
  mpv
  smplayer
  dmenu
)

echo 'installing basics...'
sudo xbps-install ${basic[@]}
echo 'xorg'
x=(
    xf86-video-intel    # intel driver (needed for screen brightness)
    xf86-input-evdev    # drivers for keyboard, trackpad, etc
    xinit
    xbacklight
    xterm
    xclip
    xorg-fonts
    xsetroot            # for dwm status bar
    setxkbmap           # so I can set keyboard to colemak in X
)

echo 'suckless dependencies'
sl=(
    libX11-devel
    libXft-devel
    libXinerama-devel
    libXrandr-devel
)



echo 'compile sucklees stuff'
make=(
    st
    dwm
    slock
    surf
    sxiv
)

for util in ${make[@]}
do
    git clone git://github.com/bahamas10/vpm.git
    mkdir -p ~/bin
    ln -s "$PWD/vpm" ~/bin/vpm
done
