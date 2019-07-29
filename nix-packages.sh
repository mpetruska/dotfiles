#!/usr/bin/env bash

nix-channel --add https://nixos.org/channels/nixpkgs-unstable nixpkgs
nix-channel --update

# Applications

nix-env -iA nixos.firefox nixos.termite nixos.ranger nixos.slack \
        nixos.xorg.xkill nixos.skype nixos.dpkg nixos.openvpn \
        nixos.lm_sensors nixos.postman nixos.kdeApplications.spectacle \
        nixos.calc nixos.libreoffice nixos.unzip nixos.lolcat \
        nixos.cowsay nixos.fzf nixos.commonsCompress nixos.ncdu \
        nixos.python36Packages.glances nixos.chkrootkit nixos.rstudio \
        nixos.ammonite nixos.gnuplot nixos.zip nixos.thunderbird \
        nixpkgs.protonmail-bridge nixos.f3 nixos.cryptsetup nixos.partition-manager \
        nixos.remmina

# Media

nix-env -iA nixos.mplayer nixos.youtubeDL nixos.python36Packages.mps-youtube \
	nixos.asciinema nixos.w3m nixos.libcaca nixos.vokoscreen nixos.espeak \
	nixos.cmus nixos.powerline-fonts nixos.tetex nixos.lsof nixos.ffmpeg-full

# Development

nix-env -iA nixos.atom nixos.docker nixos.git nixos.sbt nixos.scala \
	nixos.emacs nixos.jetbrains.idea-community nixos.vagrant \
	nixos.dbeaver nixos.nodejs nixos.yarn nixos.figlet nixos.gnumake \
	nixos.jq nixos.telnet nixos.stack nixos.cloc nixos.swiProlog \
        nixos.opam nixos.gcc nixos.gnum4 nixos.highlight nixos.jdk \
        nixos.insomnia
