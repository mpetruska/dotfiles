#!/bin/bash

nix-channel --add https://nixos.org/channels/nixpkgs-unstable nixpkgs
nix-channel --update

# Application

nix-env -i firefox

# Development

nix-env -i atom docker git sbt scala \
           idea-community
