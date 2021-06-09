#!/bin/bash

# docker exec ipfs ipfs add /home/metadata.json

docker exec ipfs ipfs add --recursive /home/images

docker exec ipfs ipfs add --recursive /home/metadata

# FILES=./images/*
# for f in $FILES
# do
#   docker exec ipfs ipfs add /home/images/"$(printf %q "$f")"
# done