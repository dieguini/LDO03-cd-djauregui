#!/bin/bash

# Makefile
sudo apt install make -y && sudo make
# Change AWS Credentials Permissions
sudo chmod 600 /home/vscode/.aws/credentials
# GitFlow
sudo apt-get update
sudo apt-get install git-flow