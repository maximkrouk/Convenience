#!/bin/bash

xcodebuild \
    -workspace Example/Convenience.xcworkspace \
    -scheme Convenience-Example \
    -destination "platform=iOS Simulator,OS=13.0,name=iPhone Xs" \
    clean test | xcpretty
