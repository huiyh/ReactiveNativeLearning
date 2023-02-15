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


## 命令行工具使用

### 运行

#### Run instructions for Android:
• Have an Android emulator running (quickest way to get started), or a device connected.

• cd "/Users/hyh/Examples/RN/AwesomeTSProject" && npx react-native run-android

#### Run instructions for iOS:
• cd "/Users/hyh/Examples/RN/AwesomeTSProject" && npx react-native run-ios

- or -

• Open AwesomeTSProject/ios/AwesomeTSProject.xcworkspace in Xcode or run "xed -b ios"

• Hit the Run button

#### Run instructions for macOS:
• See https://aka.ms/ReactNativeGuideMacOS for the latest up-to-date instructions.

### 基础功能

#### npx react-native --help
```shell
Usage: react-native [command] [options]

Options:
  -v                                         Output the current version
  --verbose                                  Increase logging verbosity
  -h, --help                                 display help for command

Commands:
  init [options] <projectName>               Initialize a new React Native project named <projectName> in a directory of the same name.
  doctor [options]                           Diagnose and fix common Node.js, iOS, Android & React Native issues.
  bundle [options]                           builds the javascript bundle for offline use
  ram-bundle [options]                       builds javascript as a "Random Access Module" bundle for offline use
  start [options]                            starts the webserver
  config                                     Print CLI configuration
  clean [options]                            Cleans your project by removing React Native related caches and modules.
  info                                       Get relevant version info about OS, toolchain and libraries
  upgrade [version]                          Upgrade your app's template files to the specified or latest npm version using `rn-diff-purge` project. Only valid semver versions are allowed.
  profile-hermes [options] [destinationDir]  Pull and convert a Hermes tracing profile to Chrome tracing profile, then store it in the directory <destinationDir> of the local machine
  log-ios                                    starts iOS device syslog tail
  run-ios [options]                          builds your app and starts it on iOS simulator
  log-android                                starts logkitty
  run-android [options]                      builds your app and starts it on a connected Android emulator or device
  help [command]                             display help for command
```

#### 日志级别控制
```shell
// Run CLI with --verbose flag for more details.
npx react-native run-android --verbose
```

#### npx react-native ram-bundle --help
```shell
Usage: react-native ram-bundle [options]

builds javascript as a "Random Access Module" bundle for offline use

Options:
  --entry-file <path>                    Path to the root JS file, either absolute or relative to JS root
  --platform <string>                    Either "ios" or "android" (default: "ios")
  --transformer <string>                 Specify a custom transformer to be used
  --dev [boolean]                        If false, warnings are disabled and the bundle is minified (default: true)
  --minify [boolean]                     Allows overriding whether bundle is minified. This defaults to false if dev is true, and true if dev is false. Disabling minification can be useful for speeding
                                         up production builds for testing purposes.
  --bundle-output <string>               File name where to store the resulting bundle, ex. /tmp/groups.bundle
  --bundle-encoding <string>             Encoding the bundle should be written in (https://nodejs.org/api/buffer.html#buffer_buffer). (default: "utf8")
  --max-workers <number>                 Specifies the maximum number of workers the worker-pool will spawn for transforming files. This defaults to the number of the cores available on your machine.
  --sourcemap-output <string>            File name where to store the sourcemap file for resulting bundle, ex. /tmp/groups.map
  --sourcemap-sources-root <string>      Path to make sourcemap's sources entries relative to, ex. /root/dir
  --sourcemap-use-absolute-path          Report SourceMapURL using its full path (default: false)
  --assets-dest <string>                 Directory name where to store assets referenced in the bundle
  --unstable-transform-profile <string>  Experimental, transform JS for a specific JS engine. Currently supported: hermes, hermes-canary, default
  --asset-catalog-dest [string]          Path where to create an iOS Asset Catalog for images
  --reset-cache                          Removes cached files (default: false)
  --read-global-cache                    Try to fetch transformed JS code from the global cache, if configured. (default: false)
  --config <string>                      Path to the CLI configuration file
  --generate-static-view-configs         Generate static view configs for Fabric components. If there are no Fabric components in the bundle or Fabric is disabled, this is just no-op. (default: true)
  --indexed-ram-bundle                   Force the "Indexed RAM" bundle file format, even when building for android (default: false)
  -h, --help                             display help for command
```

#### bundle
```shell
npx react-native bundle --platform android --dev false --entry-file index.js --bundle-output android/app/src/main/assets/index.android.bundle --assets-dest android/app/src/main/res
```

# 技术细节

