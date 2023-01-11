#!/bin/bash

sudo yum update -y
sudo amazon-linux-extras install docker -y
sudo usermod -a -G docker ec2-user