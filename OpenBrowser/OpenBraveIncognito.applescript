tell application "System Events" to set listOfProcesses to (name of every process where background only is false)
if "Brave Browser" is not in listOfProcesses then
	tell application "Brave Browser"
		close windows
		make new window with properties {mode:"incognito"}
		tell application "System Events" to keystroke "f" using {control down, command down}
	end tell
end if
