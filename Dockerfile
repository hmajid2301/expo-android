FROM node:latest
LABEL version=0.2.0

RUN mkdir /app && \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb http://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update && \
    apt-get install yarn && \
    apt-get install android-tools-adb android-tools-fastboot

WORKDIR /app
COPY package.json yarn.lock app.json ./
RUN yarn --network-timeout 1000000
CMD yarn run start