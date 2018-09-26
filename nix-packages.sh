#/bin/bash

nix-channel --add https://nixos.org/channels/nixpkgs-unstable nixpkgs
nix-channel --update

# Application

nix-env -iA nixos.firefox nixos.termite nixos.ranger

# Development

nix-env -iA nixos.atom nixos.docker nixos.git nixos.sbt nixos.scala \
           nixos.jetbrains.idea-community
