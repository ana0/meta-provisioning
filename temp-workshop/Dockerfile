FROM node:18-slim

WORKDIR /usr/src

# Create man folders which are required by postgres
RUN seq 1 8 | xargs -I{} mkdir -p /usr/share/man/man{}

# Install dependencies
RUN apt-get update \
      && apt-get install -y git python3 build-essential 

# Install and build culturestake app
RUN git clone https://github.com/ana0/workshop-dao-app.git app \
   && cd app \
   && git checkout --quiet ${GIT_COMMIT}

WORKDIR /usr/src/app/backend

RUN npm install --legacy-peer-deps 

EXPOSE 8040

COPY api/run.sh .

CMD npm start
