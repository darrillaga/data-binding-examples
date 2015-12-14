#!/bin/bash

# Fix the CircleCI path
function getAndroidSDK(){
  export PATH="$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools:$PATH"

  DEPS="$ANDROID_HOME/installed-dependencies"

  if [ ! -e $DEPS ]; then
    cp -r /usr/local/android-sdk-linux $ANDROID_HOME &&
    echo y | android update sdk --no-ui --all --filter tool,extra-android-m2repository,extra-android-support,extra-google-google_play_services,extra-google-m2repository,android-23 &&
    echo y | android update sdk --no-ui --all --filter build-tools-23.0.2 &&
    # echo no | android create avd -n testAVD -f -t android-23 --abi default/x86 &&
    touch $DEPS
  fi
}