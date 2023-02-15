# 官网
* React Native [https://reactnative.dev](https://reactnative.dev/)
* React Native 中文网 [https://www.reactnative.cn](https://www.reactnative.cn/)
  * [搭建开发环境](https://www.reactnative.cn/docs/environment-setup)
  
# 基本流程

## 环境搭建

[学习笔记 —— React Native环境搭建](https://docs.qq.com/doc/DSnpnUU5ZY0tHello?&u=84ec9a0eccc94de1b9cf7e25efd7e45c)

### 工程结构改造

* Native工程包含RN工程，而非RN默认的 RN工程包含Nativie工程。
  * 阻碍："../node_modules/@react-native-community/cli-platform-android/native_modules.gradle" 中写死了node执行的目录为Native工程所在目录。
  * 解决方案：工程结构改造为
```
- NativeApp （依赖 RnNativeLib）
  - RnJsLib
    - RnNativeLib （引用 RnJsLib中的脚本）
```

```shell
// 测试
node -e "try {console.log(require('@react-native-community/cli').bin);} catch (e) {console.log(require('react-native/cli').bin);}"
```


## 运行

### Run instructions for Android:
• Have an Android emulator running (quickest way to get started), or a device connected.

• cd "/Users/hyh/Examples/RN/AwesomeTSProject" && npx react-native run-android

### Run instructions for iOS:
• cd "/Users/hyh/Examples/RN/AwesomeTSProject" && npx react-native run-ios

- or -

• Open AwesomeTSProject/ios/AwesomeTSProject.xcworkspace in Xcode or run "xed -b ios"

• Hit the Run button

### Run instructions for macOS:
• See https://aka.ms/ReactNativeGuideMacOS for the latest up-to-date instructions.

# 技术细节

