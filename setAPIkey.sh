#!/bin/bash

# DOWNLOAD env Variable from 
# https://drive.google.com/drive/folders/1FN2ojK1K2lT6PTim3QDCLn187oRwFRgP
# run that script will also invoke this script

# Make sure you has the key before run this script
if [ -z "$ANDROID_API_KEY" ]; then
    echo "ANDROID_API_KEY is empty"
    exit 1
elif [ -z "$IOS_API_KEY" ]; then
    echo "IOS_API_KEY is empty"
    exit 2
fi

sed -i '' "s/ANDROID_API_KEY/$ANDROID_API_KEY/g" android/app/src/debug/google-services.json
sed -i '' "s/ANDROID_API_KEY/$ANDROID_API_KEY/g" android/app/src/release/google-services.json
sed -i '' "s/ANDROID_API_KEY/$ANDROID_API_KEY/g" android/app/src/main/AndroidManifest.xml
sed -i '' "s/ANDROID_API_KEY/$ANDROID_API_KEY/g" lib/service/google/google_helper.dart
sed -i '' "s/IOS_API_KEY/$IOS_API_KEY/g" ios/Debug/GoogleService-Info.plist
sed -i '' "s/IOS_API_KEY/$IOS_API_KEY/g" ios/Release/GoogleService-Info.plist
sed -i '' "s/IOS_API_KEY/$IOS_API_KEY/g" ios/Runner/AppDelegate.swift
sed -i '' "s/IOS_API_KEY/$IOS_API_KEY/g" lib/service/google/google_helper.dart

echo "API Key Set"
exit 0