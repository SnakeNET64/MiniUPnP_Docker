# MiniUPnP_Docker
Allow you to use miniupnp client thanks to docker.

MiniUPnP binaries need to be compiled before being used and no up-to-date docker exist in the docker hub.
As you probably just want to use this tool out-of-the-box, here is a way to create yourself the docker image for MiniUPnP client with the latest sources.

# Pre-requisite : 
- Docker : to compile and to create the image
- sudo : to run docker commands
- curl and jq : to find the latest version available

# How to use
- Create a folder
- download the script in this folder
- run the script

# What you will get
- a docker export of MiniUPnP
