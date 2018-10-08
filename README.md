# docker-expo-react-native

This is a docker container which can be used a base to run Expo/React Native on an android device.

## How to run

ADB_IP is the IP address of the android device you wish to run expo on, in this example an Android emulator running on my local machine (Genymotion).

`docker run --env ADB_IP=192.168.112.101 expo_android`

If you have issues connecting to your android device due to network timeouts try setting the REACT_NATIVE_PACKAGER_HOSTNAME to the IP of the host device docker is running on.

`docker run --env REACT_NATIVE_PACKAGER_HOSTNAME=192.168.1.1 --env ADB_IP=192.168.112.101 expo_android`

## More information

* Expo
* React Native
* Genymotion
