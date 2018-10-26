FROM openjdk:8-jdk-alpine 
MAINTAINER Ken Godoy version: 0.2

RUN apk add --update wget expect 
RUN mkdir /opt
RUN wget http://dl.google.com/android/android-sdk_r24.2-linux.tgz && tar -xvf android-sdk_r24.2-linux.tgz -C /opt/
COPY tools /opt/sdk-tools
RUN chmod a+x /opt/sdk-tools/android-accept-licenses.sh
ENV ANDROID_HOME /opt/android-sdk-linux
ENV PATH ${PATH}:/opt/sdk-tools:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools:${ANDROID_HOME}/build-tools/23.0.2/

RUN ["/opt/sdk-tools/android-accept-licenses.sh", "android update sdk --filter tools --no-ui --force -a"]
RUN ["/opt/sdk-tools/android-accept-licenses.sh", "android update sdk --filter platform-tools --no-ui --force -a"]
RUN ["/opt/sdk-tools/android-accept-licenses.sh", "android update sdk --filter \"build-tools-23.0.2\" --no-ui --force -a"]
RUN ["/opt/sdk-tools/android-accept-licenses.sh", "android update sdk --filter \"extra-android-support\" --no-ui --force -a"]
RUN ["/opt/sdk-tools/android-accept-licenses.sh", "android update sdk --filter \"android-23\" --no-ui --force -a"]
RUN echo "test"
