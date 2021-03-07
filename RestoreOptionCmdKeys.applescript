tell application "Finder"
    set currentDir to (container of (path to me)) as string
end tell

set inputAppleScriptPosixPath to POSIX path of (currentDir & "ModifyOptionCmdKeys.applescript")
set outputScptPath to (currentDir & "ModifyOptionCmdKeys.scpt")
set outputScptPosixPath to POSIX path of outputScptPath

do shell script "osacompile -o " & outputScptPosixPath & " " & inputAppleScriptPosixPath
set modifyKeysLib to load script file outputScptPath
modifyKeysLib's modifyOptionAndCmdKeys("restore")
do shell script "rm -rf " & outputScptPosixPath
