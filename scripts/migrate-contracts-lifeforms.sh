#!/bin/bash

source "scripts/common.sh"

REPOSITORY=https://github.com/ana0/lifeforms-contracts.git
FOLDER_NAME=lifeforms-contracts

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