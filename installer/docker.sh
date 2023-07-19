

#install docker

#this is for docker cli

#load the KVM module manually
sudo modprobe kvm
#sudo modprobe kvm_intel  # Intel processors
sudo modprobe kvm_amd    # AMD processors

#Add your system user to the KVM group.
sudo usermod -aG kvm $USER

#remove the existing repository
sudo apt remove docker docker-engine docker.io 2>/dev/null
sudo apt update

#install dependencies
sudo apt -y install apt-transport-https ca-certificates curl software-properties-common

#add docker repo
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/docker-archive-keyring.gpg
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

#install docker
sudo apt install docker-ce docker-ce-cli containerd.io uidmap

sudo usermod -aG docker $USER
newgrp docker



#this is for desktop
#download docker deb
wget https://desktop.docker.com/linux/main/amd64/docker-desktop-4.21.1-amd64.deb
#clean up
sudo apt remove docker-desktop
rm -r $HOME/.docker/desktop
sudo rm /usr/local/bin/com.docker.cli
sudo apt purge docker-desktop
#install downloaded deb
sudo apt install ./docker-desktop-*-amd64.deb
#run docker service
systemctl --user start docker-desktop
