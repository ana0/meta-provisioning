#!/bin/bash

docker exec ipfs ipfs add --recursive /home/images

docker exec ipfs ipfs add --recursive /home/metadata

FILES=./clickmine/*
for f in $FILES
do
  docker exec ipfs ipfs add /home/"$(printf %q "$f")"
done