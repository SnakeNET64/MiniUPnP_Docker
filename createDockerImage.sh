## Détecter la derniere version : http://miniupnp.free.fr/files/rest.php/tags?count=1
upnpcLatest=`curl http://miniupnp.free.fr/files/rest.php/tags?count=1 | jq -r ".tags.miniupnpc | .[] | .file"`

## Créer le conteneur docker qui servira à compiler
cat <<ENDOFFILE >Dockerfile
  FROM alpine:latest
  RUN apk add alpine-sdk
  RUN wget http://miniupnp.free.fr/files/download.php?file=$upnpcLatest -O latest.tar.gz ; tar -zxf latest.tar.gz ;cd miniupnpc-* ; make; mkdir /deploy ; make DESTDIR=/deploy install; make install
  ENTRYPOINT ["/deploy/usr/bin/upnpc"]
ENDOFFILE

## Compiler le docker
sudo docker build -t miniupnpc .

## Tester
sudo docker rm miniupnpc 2>/dev/null
sudo docker run --interactive --tty --network host --name miniupnpc miniupnpc --help

## Extraire les fichiers compilés
mkdir AlpineBinaries
sudo docker cp miniupnpc:/deploy ./AlpineBinaries

## Supprimer le docker 'miniupnpc' temporaire
sudo docker rm miniupnpc 2>/dev/null

## Créer le fichier de build docker
cat <<ENDOFFILE >Dockerfile
  FROM alpine:latest
  COPY AlpineBinaries/deploy /
  ENTRYPOINT ["/usr/bin/upnpc"]
ENDOFFILE

## Créer un nouveau docker avec uniquement l'applicatif upnpc
sudo docker build -t miniupnpc .

## Test de l'image
sudo docker rm miniupnpc 2>/dev/null
sudo docker run --rm --interactive --tty --network host --name miniupnpc miniupnpc --help

## Nettoyer les dernières traces
sudo rm -rf AlpineBinaries
sudo docker rm miniupnpc 2>/dev/null
rm Dockerfile

## Sauver l'image dans un fichier tar
sudo docker save --output miniupnpc.tar miniupnpc
