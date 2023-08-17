How to use it the quick way :

<code>wget https://github.com/SnakeNET64/MiniUPnP_Docker/raw/main/Build/miniupnpc.2.2.5.tar.gz
gunzip miniupnpc.2.2.5.tar.gz
docker load -i miniupnpc.2.2.5.tar
docker run --rm --interactive --tty --network host miniupnpc:2.2.5 --help
</code>
