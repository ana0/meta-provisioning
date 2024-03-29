#!/bin/bash

source "scripts/common.sh"

REPOSITORY=https://github.com/ana0/mirror-piece-contracts.git
FOLDER_NAME=mirror-piece-contracts

check_tmp_folder $REPOSITORY $FOLDER_NAME

# Clean up
rm -rf build

# Use this for local testing:
# git checkout 123457

git fetch --all
git reset --hard origin/main

# Link to .env file
ln -f -s ../../.env .env

# Install dependencies
echo "Installing npm dependencies .."
npm ci &> /dev/null

# Migrate contracts
npm run migrate