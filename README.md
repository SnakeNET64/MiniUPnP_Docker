# MiniUPnP_Docker
Allow you to use miniupnp client thanks to docker.

MiniUPnP binaries need to be compiled before being used and no up-to-date docker exist in the docker hub.
As you probably just want to use this tool out-of-the-box, here is a way to create yourself the docker image for MiniUPnP client with the latest sources.

# Pre-requisite : 
- Docker (how to install for Debian below)
sudo apt -y update
sudo apt -y install apt-transport-https ca-certificates curl gnupg2 software-properties-common
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable" | sudo tee -a  /etc/apt/sources.list.d/docker.list
sudo apt -y install docker-ce docker-ce-cli containerd.io
sudo systemctl enable docker
- sudo, curl and jq
sudo apt install jq curl


# How to use
- Create a folder
- download the script
- run the script
