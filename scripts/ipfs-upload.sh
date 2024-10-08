#!/bin/bash

docker exec ipfs ipfs add --recursive /home/images

docker exec ipfs ipfs add --recursive /home/metadata

docker exec ipfs ipfs add --recursive /home/promptbaby

docker exec ipfs ipfs add -w /home/misc/off-contract.json

docker exec ipfs ipfs add -w /home/misc/off.png

docker exec ipfs ipfs add -w /home/misc/lifeforms-contract.json

docker exec ipfs ipfs add -w /home/misc/glitch.mp4

docker exec ipfs ipfs add -w /home/misc/glitch-cover.gif

docker exec ipfs ipfs add -w /home/misc/glitch-metadata.json

docker exec ipfs ipfs add -w /home/misc/glitch-contract.json

docker exec ipfs ipfs add -w /home/misc/coinbg.jpg

docker exec ipfs ipfs add -w /home/misc/clickmine-contract.json

docker exec ipfs ipfs add -w /home/misc/wildcards-contract.json

docker exec ipfs ipfs add -w /home/misc/touching-grass-animation.mp4

docker exec ipfs ipfs add -w /home/misc/touching-grass.jpg

docker exec ipfs ipfs add -w /home/misc/grid.mp4

docker exec ipfs ipfs add -w /home/misc/grid-HD.mp4

docker exec ipfs ipfs add -w /home/misc/grid.png

docker exec ipfs ipfs add -w /home/misc/mirror-piece-square.jpg

FILES=./clickmine/*
for f in $FILES
do
  docker exec ipfs ipfs add -w /home/"$(printf %q "$f")"
done

