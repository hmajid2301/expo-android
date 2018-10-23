# Expo/React-Native Android Docker container

This is a docker container which can be used a base to run Expo/React Native on an android device.

## How to run

ADB_IP is the IP address of the android device you wish to run expo on, in this example an Android emulator running on my local machine (Genymotion).
Also should pubblish ports 19000 and 190001 on the docker container as expo uses these for the packager and debugging.

`docker run hmajid2301/expo-android -p 19000:19000 -p 19001:19001`

If you have issues connecting to your android device due to network timeouts try setting the REACT_NATIVE_PACKAGER_HOSTNAME to the IP of the host device docker is running on.

`docker run --env REACT_NATIVE_PACKAGER_HOSTNAME=192.168.1.1 hmajid2301/expo-android -p 19000:19000 -p 19001:19001`

## Create your own dockerfile

Of course this is a very barebones docker image so you should create your own using this as a base.

```docker
FROM hmajid2301/expo_docker:latest

COPY src/ assets/ package.json yarn.lock /app
RUN yarn
CMD adb connect $ADB_IP && \
    yarn run android
```

## License

MIT

## More information

* [Expo](https://expo.io)
* [React Native](http://www.reactnative.com/)
