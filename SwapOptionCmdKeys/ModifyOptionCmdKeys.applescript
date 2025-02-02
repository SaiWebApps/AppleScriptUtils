(*
 * Modify the operations to which the option and command keys are mapped based on
 * operationName. If operationName is "swap," then map option to command, and vice versa.
 * But if operationName is "restore," then restore the original mappings.
 *)
on modifyOptionAndCmdKeys(operationName)
    tell application "System Preferences"
        activate
        set current pane to pane "com.apple.preference.keyboard"
    end tell

    tell application "System Events" to tell application process "System Preferences"
        repeat until exists tab group of window "Keyboard"
        end repeat

        click button "Modifier Keys…" of tab group of window "Keyboard"

        if (exists pop up button "Select keyboard:" of sheet of window "Keyboard") then
            click pop up button "Select keyboard:" of sheet of window "Keyboard"
            click menu item "Apple Internal Keyboard / Trackpad" of menu of pop up button "Select keyboard:" of sheet of window "Keyboard"
        end if

        if (operationName = "swap") then
            click pop up button "Option (⌥) Key:" of sheet of window "Keyboard"
            click menu item "⌘ Command" of menu of pop up button "Option (⌥) Key:" of sheet of window "Keyboard"
            click pop up button "Command (⌘) Key:" of sheet of window "Keyboard"
            click menu item "⌥ Option" of menu of pop up button "Command (⌘) Key:" of sheet of window "Keyboard"
        else if (operationName = "restore") then
            click pop up button "Option (⌥) Key:" of sheet of window "Keyboard"
            click menu item "⌥ Option" of menu of pop up button "Option (⌥) Key:" of sheet of window "Keyboard"
            click pop up button "Command (⌘) Key:" of sheet of window "Keyboard"
            click menu item "⌘ Command" of menu of pop up button "Command (⌘) Key:" of sheet of window "Keyboard"
        end if

        click button "OK" of sheet of window "Keyboard"
    end tell

    tell application "System Preferences" to quit
end modifyOptionAndCmdKeys
