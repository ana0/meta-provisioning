#!/bin/bash

docker exec ipfs ipfs add --recursive /home/images

docker exec ipfs ipfs add --recursive /home/metadata

docker exec ipfs ipfs add -w /home/misc/off-contract.json

docker exec ipfs ipfs add -w /home/misc/off.png

docker exec ipfs ipfs add -w /home/misc/lifeforms-contract.json

FILES=./clickmine/*
for f in $FILES
do
  docker exec ipfs ipfs add /home/"$(printf %q "$f")"
done