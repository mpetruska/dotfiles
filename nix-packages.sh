#/bin/bash

nix-channel --add https://nixos.org/channels/nixpkgs-unstable nixpkgs
nix-channel --update

# Applications

nix-env -iA nixos.firefox nixos.termite nixos.ranger nixos.slack \
	nixos.xorg.xkill nixos.skype nixos.dpkg nixos.openvpn \
	nixos.lm_sensors nixos.postman nixos.kdeApplications.spectacle \
	nixos.calc nixos.libreoffice

# Media

nix-env -iA nixos.mplayer nixos.youtubeDL nixos.python36Packages.mps-youtube \
	nixos.asciinema nixos.w3m nixos.libcaca nixos.vokoscreen nixos.mimic

# Development

nix-env -iA nixos.atom nixos.docker nixos.git nixos.sbt nixos.scala \
	nixos.emacs nixos.jetbrains.idea-community nixos.vagrant \
	nixos.dbeaver nixos.nodejs nixos.yarn nixos.figlet
