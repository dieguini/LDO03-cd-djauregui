#!/bin/bash
 
wget https://storage.googleapis.com/golang/getgo/installer_linux
chmod +x ./installer_linux
./installer_linux
source /home/ec2-user/.bash_profile
go version
