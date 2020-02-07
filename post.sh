
#!/bin/bash
# Void Linux post-install script

bypass() {
	doas -v
	while true;
	do
	  doas -n true
	  sleep 45
	  kill -0 "$$" || exit
	done 2>/dev/null &
}

echo "Starting Void Linux post-install script..."
sleep 3s
	bypass

echo "Updating system..."
sleep 3s
	doas xbps-install -Syu

clear

echo "Installing packages..."
sleep 3s
	doas xbps-install -Sy xorg xf86-input-libinput xf86-input-synaptics xf86-video-fbdev xautolock xbacklight xclip xclipboard xinit xmodmap xscreensaver xwallpaper libva make gcc base-devel libX11-devel libXrandr-devel libXft-devel libXinerama-devel pkg-config
	doas xbps-install -Sy xf86-video-intel libva-intel-driver linux-firmware-intel
	doas xbps-install -Sy alsa-utils
  doas xbps-install -Sy acpi acpid bash-completion curl dash dunst htop libnotify redshift st-terminfo wget unclutter-xfixes
	doas xbps-install -Sy p7zip libzip unzip zip
	doas xbps-install -Sy python3 python3-devel python3-pip python3-pyperclip
	doas xbps-install -Sy fontconfig nerd-fonts-otf font-awesome breeze-purple-cursor-theme
	doas xbps-install -Sy ffmpeg ImageMagick maim sxiv
	doas xbps-install -Sy ffmpegthumbnailer poppler vifm
	doas xbps-install -Sy mpv youtube-dl castero newsboat
	doas xbps-install -Sy mpd mpc ncmpcpp
	doas xbps-install -Sy zathura zathura-cb zathura-djvu zathura-pdf-mupdf kiwix-tools
	doas xbps-install -Sy neofetch cmatrix
	doas xbps-install -Sy gtk+3 plata-theme libreoffice-writer
	doas xbps-install -Sy libvirt qemu virt-manager ebtables dnsmasq
	# doas xbps-install -Sy minetest retroarch ppsspp

	pip3 install --user bs4
	pip3 install --user urllib5
	pip3 install --user ueberzug
	pip3 install --user keepmenu

	doas xbps-remove -Oo

clear

echo "Configuring system..."
sleep 3s

	doas ln -sf /etc/sv/dbus /var/service/
	doas ln -sf /etc/sv/alsa /var/service/
	doas ln -sf /etc/sv/acpid /var/service/
	doas ln -sf /etc/sv/cgmanager /var/service/
	doas ln -sf /etc/sv/upower /var/service/
	doas ln -sf /etc/sv/dhcpcd /var/service/
  doas ln -s /etc/sv/libvirtd /var/service/
	doas ln -s /etc/sv/virtlogd /var/service/
	doas ln -s /etc/sv/virtlockd /var/service/
	doas ln -sf /etc/sv/acpid /var/service

	doas ln -sf /usr/share/fontconfig/conf.avail/10-hinting-slight.conf /etc/fonts/conf.d/
	doas ln -sf /usr/share/fontconfig/conf.avail/10-sub-pixel-rgb.conf /etc/fonts/conf.d/
	doas ln -sf /usr/share/fontconfig/conf.avail/11-lcdfilter-default.conf /etc/fonts/conf.d/
	doas ln -sf /usr/share/fontconfig/conf.avail/50-user.conf /etc/fonts/conf.d/
	doas ln -sf /usr/share/fontconfig/conf.avail/70-no-bitmaps.conf /etc/fonts/conf.d/

	doas ln -sf /usr/share/zoneinfo/Europe/Prague /etc/localtime
	doas hwclock --systohc --utc

	echo "LANG=en_US.UTF-8" >> /etc/locale.conf
	echo "LANG=en_US.UTF-8" >> /etc/environment
	locale-gen

	doas chmod +x ~/.local/bin/*
	doas chmod +x ~/.config/sxhkd/*

	xmodmap ~/.config/appearance/Xmodmap

	# Finish
	cd ~/
	doas resolvconf -u

clear

echo "Adding user to some groups..."
sleep 3s
	doas usermod -aG input $USER
	doas usermod -aG audio $USER
	doas usermod -aG video $USER
	doas usermod -aG wheel $USER
	doas usermod -aG libvirt $USER
	doas usermod -aG kvm $USER
	doas xbps-install -Syu
clear

echo "Don't forget to install st, dmenu, and slock with doas make clean install"
