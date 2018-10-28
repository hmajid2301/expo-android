FROM node:10.12.0-alpine as BASE
LABEL version=1.1.0

EXPOSE 19000 
EXPOSE 19001

RUN apk --update-cache --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ add android-tools && \
    apk add --no-cache bash

WORKDIR /app
COPY package.json yarn.lock app.json ./
RUN yarn --network-timeout 100000 

CMD yarn run start