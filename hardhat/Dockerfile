FROM node:20-slim

WORKDIR /usr/src

# Install dependencies
RUN apt-get update 

RUN npm init -y

RUN npm install hardhat @nomicfoundation/hardhat-toolbox

EXPOSE 8545

COPY hardhat/hardhat.config.js .

CMD npx hardhat node
