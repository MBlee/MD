> npx create-expo-app@latest

## Components

### Platform

```ts
// PlatModule
import {Platform} from 'react-native';
const verIOS = parseInt(Platform.Version, 10);
- Platform.OS
- Platform.select({ios,android,default})
// Extensions
- .ios/.android/.native
```

## ---------

## Debug

## Test

## Setup

```shell
# node: >=18.18
# JDK: 17
choco install -y nodejs-lts microsoft-openjdk17
```

```shell
# Android Studio
# SDK管理器
- SDK Platforms > Show Package Details
- Android 15 (UpsideDownCake)
  - Android SDK Platform 35
  - Intel x86 Atom_64 System Image
  - Google APIs Intel x86 Atom System Image
- SDK Tools > Show Package Details
  - Android SDK Build-Tools > 35.0.0
# ANDROID_HOME环境变量
- ANDROID_HOME: %LOCALAPPDATA%\Android\Sdk
- shell：Get-ChildItem -Path Env:\
# Path: platform-tools
- Path: %LOCALAPPDATA%\Android\Sdk\platform-tools

# 使用虚拟设备
- ./AwesomeProject/android
- AVD Manager
- UpsideDownCake API Level 34 image
# Error
- Could not install Gradle distribution
```

