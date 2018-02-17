#!/bin/bash

#############
# Parameters
#############
AZUREUSER=$1
NODE_ID=$2
ARTIFACTS_URL_PREFIX=$3;
FQDN=$4;
VMNODEPREFIX=$5;

###########
# Constants
###########
HOMEDIR="/home/$AZUREUSER";
ROOTNODE="$VMNODEPREFIX 0" 

###################################
# Install Docker engine and compose
###################################
sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update
sudo apt-get install -y docker-ce
sudo systemctl enable docker
sleep 5
sudo curl -L "https://github.com/docker/compose/releases/download/1.11.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

##########################################
# Patch the docker config based on node id
##########################################
cd $HOMEDIR
wget -N ${ARTIFACTS_URL_PREFIX}/scripts/docker-compose.yml

CURRENT_NODE_IP=`nslookup "$VMNODEPREFIX"0 | grep "Address:" | tail -n1| grep -oP '\d+\.\d+\.\d+\.\d+'`
sed -i "s/#NODE_IP/$CURRENT_NODE_IP/" $HOMEDIR/docker-compose.yml || exit 1;
sed -i "s/#NODE_ID/$NODE_ID/" $HOMEDIR/docker-compose.yml || exit 1;

#########################################
# Install docker image from private repo
#########################################
sudo docker login -u ipfspriv -p O=dHCN7I5CpSldKeiE6EI0qbyGYjeb6u ipfspriv.azurecr.io
sudo docker pull ipfspriv.azurecr.io/ipfs/azure
sudo docker-compose up -d