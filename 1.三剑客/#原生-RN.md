> npx create-expo-app@latest



## ......

## 安装

> Window

```shell
# node: >=18.18
# JDK: 17
choco install -y nodejs-lts microsoft-openjdk17
```

```shell
# Android Studio

# 1.SDK管理器
- SDK Platforms > Show Package Details
- Android 14 (UpsideDownCake)
  - Android SDK Platform 34
  - Intel x86 Atom_64 System Image
  - Google APIs Intel x86 Atom System Image
- SDK Tools > Show Package Details
  - Android SDK Build-Tools > 34.0.0
# 2.ANDROID_HOME环境变量
- ANDROID_HOME
- %LOCALAPPDATA%\Android\Sdk
- shell：Get-ChildItem -Path Env:\
# 3.platform-tools添加到Path
- Path
- %LOCALAPPDATA%\Android\Sdk\platform-tools

# 使用虚拟设备
- ./AwesomeProject/android
- AVD Manager
- UpsideDownCake API Level 34 image

# Error
- Could not install Gradle distribution
```