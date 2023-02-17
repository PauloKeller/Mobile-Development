#React-Native 0.49.0+
- react-native bundle --dev false --platform android --entry-file index.js --bundle-output ./android/app/build/intermediates/assets/debug/index.android.bundle --assets-dest ./android/app/build/intermediates/res/merged/debug

#React-Native 0-0.49.0
- react-native bundle --dev false --platform android --entry-file index.android.js --bundle-output ./android/app/build/intermediates/assets/debug/index.android.bundle --assets-dest ./android/app/build/intermediates/res/merged/debug

- $ cd android
#Create debug build:
- $ ./gradlew assembleDebug
#Create release build:
- $ ./gradlew assembleRelease #Generated `apk` will be located at `android/app/build/outputs/apk`
