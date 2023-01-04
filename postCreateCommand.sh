#!/bin/bash

# Makefile
sudo apt install make -y && sudo make
# Change AWS Credentials Permissions
sudo chmod 600 /home/vscode/.aws/credentials
# Keybase
# curl --remote-name https://prerelease.keybase.io/keybase_amd64.deb && sudo apt-get install -y ./keybase_amd64.deb