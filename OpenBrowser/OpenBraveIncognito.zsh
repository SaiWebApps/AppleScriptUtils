#!/bin/zsh

osascript -e 'tell application "System Events" to set listOfProcesses to (name of every process where background only is false)' | grep "Brave Browser"
if [[ $? -ne 0 ]]; then
    /Applications/Brave\ Browser.app/Contents/MacOS/Brave\ Browser --incognito --start-fullscreen --no-default-browser-check
fi
