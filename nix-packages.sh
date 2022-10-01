#!/usr/bin/env bash

nix-channel --add https://nixos.org/channels/nixpkgs-unstable nixpkgs
nix-channel --update

# Binary cache

nix-env -iA cachix -f https://cachix.org/api/v1/install
cachix use kore

# Applications

nix-env -iA nixos.firefox nixos.ranger nixos.slack \
        nixos.xorg.xkill nixos.skype nixos.dpkg nixos.openvpn \
        nixos.lm_sensors nixos.postman nixos.kdeApplications.spectacle \
        nixos.calc nixos.libreoffice nixos.unzip \
        nixos.cowsay nixos.fzf nixos.commonsCompress nixos.ncdu \
        nixos.python36Packages.glances nixos.chkrootkit \
        nixos.ammonite nixos.gnuplot nixos.zip \
        nixos.f3 nixos.cryptsetup nixos.gparted \
        nixos.remmina nixos.chromium nixos.unrar nixos.nmap-graphical \
        nixos.s-tui nixos.filezilla nixos.undervolt \
        nixos.veracrypt nixos.p7zip nixos.parted nixos.mtools \
        nixos.notify-osd-customizable nixpkgs.wtf

# Media

nix-env -iA nixos.mplayer nixos.youtubeDL nixos.asciinema nixos.w3m \
	nixos.libcaca nixos.vokoscreen nixos.espeak nixos.cmus \
	nixos.powerline-fonts nixos.tetex nixos.lsof nixos.ffmpeg-full \
	nixos.shotcut nixos.gimp nixos.ntfs3g nixos.exfat \
        nixos.handbrake

# Development

nix-env -iA nixos.git nixos.emacs nixos.direnv \
	nixos.dbeaver nixos.figlet nixos.gnumake nixos.jq nixos.telnet \
	nixos.cloc nixos.gnum4 nixos.highlight nixpkgs.insomnia \
        nixpkgs.vscode nixos.bind nixos.soapui nixos.openconnect nixos.gh \
        nixpkgs.ipfs nixos.niv
