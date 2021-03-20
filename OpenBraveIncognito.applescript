tell application "System Events" to set listOfProcesses to (name of every process where background only is false)
if "Brave Browser" is not in listOfProcesses then
  do shell script "/Applications/Brave\ Browser.app/Contents/MacOS/Brave\ Browser --incognito --start-fullscreen --no-default-browser-check"
end if
