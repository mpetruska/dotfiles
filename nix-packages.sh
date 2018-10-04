#/bin/bash

nix-channel --add https://nixos.org/channels/nixpkgs-unstable nixpkgs
nix-channel --update

# Applications

nix-env -iA nixos.firefox nixos.termite nixos.ranger

# Development

nix-env -iA nixos.atom nixos.docker nixos.git nixos.jdk nixos.sbt nixos.scala \
            nixos.emacs nixos.jetbrains.idea-community nixos.vagrant
