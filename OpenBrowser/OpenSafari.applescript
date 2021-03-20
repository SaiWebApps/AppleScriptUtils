tell application "System Events" to set listOfProcesses to (name of every process where background only is false)
if "Safari" is not in listOfProcesses then
	tell application "Safari" to activate
	tell application "System Events" to keystroke "f" using {control down, command down}
end if