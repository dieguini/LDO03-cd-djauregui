#!/bin/bash

sudo yum update -y
sudo amazon-linux-extras install docker -y
sudo usermod -a -G docker ec2-user
sudo usermod -a -G docker jenkins
sudo systemctl start docker
sudo systemctl enable docker