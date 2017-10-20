FROM ubuntu:16.04
MAINTAINER Ken Godoy version: 0.1

RUN apt-get update
RUN apt-get install -y default-jdk wget 
RUN wget http://dl.google.com/android/android-sdk_r24.2-linux.tgz
RUN tar -xvf android-sdk_r24.2-linux.tgz
RUN ./android-sdk-linux/tools/android update sdk --no-ui
RUN echo 'export PATH=${PATH}:$HOME/sdk/android-sdk-linux/platform-tools:$HOME/sdk/android-sdk-linux/tools:$HOME/sdk/android-sdk-linux/build-tools/22.0.1/' >> ~/.bashrc
