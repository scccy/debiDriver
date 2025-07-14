#!/bin/bash
# 启动Flutter iOS模拟器调试
cd "$(dirname "$0")"  # 切换到脚本所在目录
export PATH=/Volumes/opt/lan/flutter/bin:$PATH
flutter clean
flutter pub get
open -a Simulator --args -CurrentDeviceUDID AD477DFB-0D08-4848-ACE5-70367576FB1A

flutter run -d AD477DFB-0D08-4848-ACE5-70367576FB1A

rm -rf Podfile.lock Pods