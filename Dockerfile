FROM node:latest
LABEL maintainer=hmajid2301@gmail.com
LABEL version=0.1.0

ENV ADB_IP 192.168.112.101

RUN mkdir /app && \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb http://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update && \
    apt-get install yarn && \
    apt-get install android-tools-adb android-tools-fastboot

WORKDIR /app
COPY package.json yarn.lock app.json ./
RUN yarn
CMD adb connect $ADB_IP && \
    yarn run android
