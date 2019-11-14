#!/bin/bash

swift package generate-xcodeproject
xcodebuild \
    -workspace Convenience.xcodeproject \
    -scheme Convenience-Package \
    -destination "platform=iOS Simulator,OS=13.0,name=iPhone Xs" \
    clean test | xcpretty
