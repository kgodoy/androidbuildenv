FROM ubuntu:16.04
MAINTAINER Ken Godoy version: 0.1

RUN apt-get update
RUN apt-get install -y default-jdk wget expect
RUN wget http://dl.google.com/android/android-sdk_r24.2-linux.tgz
RUN tar -xvf android-sdk_r24.2-linux.tgz -C /opt/
COPY tools /opt/sdk-tools
RUN chmod a+x /opt/sdk-tools/android-accept-licenses.sh
ENV ANDROID_HOME /opt/android-sdk-linux
ENV PATH ${PATH}:/opt/sdk-tools:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools:${ANDROID_HOME}/build-tools/23.0.2/

RUN ["/opt/sdk-tools/android-accept-licenses.sh", "android update sdk --filter tools --no-ui --force -a"]
RUN ["/opt/sdk-tools/android-accept-licenses.sh", "android update sdk --filter platform-tools --no-ui --force -a"]
RUN ["/opt/sdk-tools/android-accept-licenses.sh", "android update sdk --filter \"build-tools-23.0.2\" --no-ui --force -a"]
RUN ["/opt/sdk-tools/android-accept-licenses.sh", "android update sdk --filter \"extra-android-support\" --no-ui --force -a"]
RUN ["/opt/sdk-tools/android-accept-licenses.sh", "android update sdk --filter \"android-23\" --no-ui --force -a"]

RUN apt-get clean
