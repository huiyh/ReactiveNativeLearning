NATIVE_PROJECT_PATH=android/app
npx react-native bundle --platform android --dev false --entry-file index.js --bundle-output ${NATIVE_PROJECT_PATH}/src/main/assets/index.android.bundle --assets-dest ${NATIVE_PROJECT_PATH}/src/main/res
