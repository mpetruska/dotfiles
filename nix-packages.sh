#!/usr/bin/env bash

nix-channel --add https://nixos.org/channels/nixpkgs-unstable nixpkgs
nix-channel --update

# Applications

nix-env -iA nixos.firefox nixos.ranger nixos.slack \
        nixos.xorg.xkill nixos.skype nixos.dpkg nixos.openvpn \
        nixos.lm_sensors nixos.postman nixos.kdeApplications.spectacle \
        nixos.calc nixos.libreoffice nixos.unzip nixos.lolcat \
        nixos.cowsay nixos.fzf nixos.commonsCompress nixos.ncdu \
        nixos.python36Packages.glances nixos.chkrootkit \
        nixos.ammonite nixos.gnuplot nixos.zip nixos.thunderbird \
        nixos.f3 nixos.cryptsetup nixos.partition-manager \
        nixos.remmina nixos.chromium nixos.unrar nixos.nmap-graphical \
        nixos.electrum nixos.s-tui nixos.filezilla nixos.undervolt \
        nixos.veracrypt nixos.p7zip nixos.parted nixos.mtools \
        nixos.notify-osd-customizable

# Media

nix-env -iA nixos.mplayer nixos.youtubeDL nixos.asciinema nixos.w3m \
	nixos.libcaca nixos.vokoscreen nixos.espeak nixos.cmus \
	nixos.powerline-fonts nixos.tetex nixos.lsof nixos.ffmpeg-full \
	nixos.shotcut nixos.gimp nixos.ntfs3g nixos.exfat nixos.xpdf \
        nixos.handbrake nixos.qutebrowser

# Development

nix-env -iA nixos.docker nixos.docker-compose nixos.git nixos.sbt \
	nixos.scala nixos.emacs nixos.jetbrains.idea-community \
	nixos.vagrant nixos.dbeaver nixos.nodejs nixos.yarn \
	nixos.figlet nixos.gnumake nixos.jq nixos.telnet nixos.stack \
	nixos.cloc nixos.swiProlog nixos.opam nixos.gcc nixos.gnum4 \
	nixos.highlight nixpkgs.insomnia nixos.coursier \
        nixos.bloop nixpkgs.vscode nixos.bind nixos.docker-machine \
        nixos.soapui nixos.openconnect
