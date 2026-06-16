#!/usr/bin/env bash
# Install Docker and run my first container
# Tested on Ubuntu 22.04

sudo apt-get update
sudo apt-get install -y docker.io
sudo systemctl start docker
sudo docker run hello-world
