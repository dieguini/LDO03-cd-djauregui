SHELL := /bin/bash

# Local

.PHONY: config
config:
	@git config --global --add safe.directory '*'

.PHONY: profile
profile:
	@echo "alias tf=terraform" >> ~/.profile
	echo "alias m=make" >> ~/.profile
	echo "alias tf=terraform" >> ~/.profile
	source ~/.profile

.PHONY: bash
bash:
	@echo "alias tf=terraform" >> ~/.bashrc
	echo "alias m=make" >> ~/.bashrc
	echo "alias tf=terraform" >> ~/.bashrc
	source ~/.bashrc

.DEFAULT_GOAL := config

.PHONY: installgitflow
installgitflow:
	@sudo apt-get update
	sudo apt-get install git-flow
