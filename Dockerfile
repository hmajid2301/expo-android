FROM node:10.12.0-alpine as BASE
LABEL version=1.0.0

RUN apk --update-cache --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ add android-tools

WORKDIR /app
COPY package.json yarn.lock app.json ./
RUN yarn --network-timeout 1000000

FROM BASE as RELEASE

EXPOSE 19000 
EXPOSE 19001

WORKDIR /app
COPY --from=BASE /app /app
COPY --from=BASE /usr/bin/adb /usr/bin/adb

CMD yarn run start