FROM node:18-slim

ARG GIT_COMMIT

WORKDIR /usr/src

# Create man folders which are required by postgres
RUN seq 1 8 | xargs -I{} mkdir -p /usr/share/man/man{}

# Install dependencies
RUN apt-get update \
      && apt-get install -y git python3 build-essential postgresql-client

# Install and build app
RUN git clone https://github.com/ana0/meta-server.git app \
      && cd app \
      && git checkout --quiet ${GIT_COMMIT}

WORKDIR /usr/src/app

# Prepare variables
# COPY .env .

#RUN rm package-lock.json

RUN npm update -g npm

RUN npm ci --verbose \
       && npm run build

# Remove unneeded dependencies
RUN apt-get purge -y --auto-remove build-essential

WORKDIR /usr/src/app

EXPOSE 8088

COPY api/run.sh .

RUN chmod +x run.sh

ENTRYPOINT ["/usr/src/app/run.sh"]
