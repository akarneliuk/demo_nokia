#!/usr/bin/env bash

echo `date`": Staring the Docker service ..."
sudo systemctl start docker.service
echo `date`": The Docker is started ..."

echo `date`": Staring the Docker container with FTP server ..."
sudo docker container start dcf_ftp
echo `date`": The Docker container with FTP server is started ..."

echo `date`": Creating the Linux bridges ..."
sudo brctl addbr br111
sudo ifconfig br111 up
sudo brctl addbr br112
sudo ifconfig br112 up
sudo brctl addbr br113
sudo ifconfig br113 up
echo `date`": The Linux bridges are created ..."

echo `date`": Modifying the Linux firewall rules ..."
sudo iptables -I FORWARD 1 -s 10.0.0.0/8 -d 10.0.0.0/8 -j ACCEPT
sudo iptables -I INPUT 1 -s 192.168.100.0/24 -j ACCEPT
sudo iptables -I FORWARD 1 -s 192.168.100.0/24 -j ACCEPT
echo `date`": The Linux firewall rules are modified ..."

echo `date`": Starting the VMs ..."
sudo virsh start VSR11
sudo virsh start VSR12
sudo virsh start VSR13
echo `date`": The VMs are started ..."
