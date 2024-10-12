#!/bin/bash

# Firebase project name
PROJECT="salo-50057"

# Output directory for Dart files
OUTPUT_DIR="lib"

# Configure first environment
echo "Configuring for first environment..."
flutterfire config \
    --project=$PROJECT \
    --out=$OUTPUT_DIR/firebase_options.dart \
    --ios-bundle-id=com.pedromassango.salo \
    --ios-out=ios/flavors/salo/GoogleService-Info.plist \
    --android-package-name=com.pedromassango.salo \
    --android-out=android/app/src/google-services.json

# Configure second environment
echo "Configuring for second environment..."
flutterfire config \
    --project=$PROJECT \
    --out=$OUTPUT_DIR/firebase_options_pro.dart \
    --ios-bundle-id=com.pedromassango.salo.pro \
    --ios-out=ios/flavors/pro/GoogleService-Info.plist \
    --android-package-name=com.pedromassango.salo.pro \
    --android-out=android/app/src/pro/google-services.json

echo "Configuration completed for both environments."