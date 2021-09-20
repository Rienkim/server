FROM node:10.1.0-alpine

WORKDIR /app

COPY package.json /app/
COPY yarn.lock /app/

RUN yarn install --production && yarn cache clean

COPY . /app

ENV NODE_ENV production
ENV LT_DOMAIN "example.com"
ENV LT_PORT "80"
ENV LT_RANGE "1024:65535"
ENV LT_ADDRESS "0.0.0.0"
ENV LT_MAX_SOCKETS "10"
ENV LT_SECURE "false"
ENTRYPOINT [ "sh", "-c", "node -r esm ./bin/server --domain ${LT_DOMAIN} --port ${LT_PORT} --range ${LT_RANGE} --address ${LT_ADDRESS} --max-sockets ${LT_MAX_SOCKETS} --secure ${LT_SECURE}"]
