# (Un-)Swap Option and Command Keys

## Value Proposition

When remotely accessing a Windows machine from a MacBook, one must contend with different key mappings as:
* The Mac keyboard's **Option** key maps to the Windows keyboard's **Alt** key.
* The Mac keyboard's **Command** key maps to the Windows keyboard's **Windows** button, which opens up the Windows start menu.

However, as show in the image below:

![](https://external-content.duckduckgo.com/iu/?u=http%3A%2F%2F2.bp.blogspot.com%2F-PA7OBHgfY9w%2FUSNLr1vujHI%2FAAAAAAAAARU%2FfKjIvT3uwZM%2Fs1600%2FWindows%2Bvs%2BMac%2BKeyboard%2BVector.jpg&f=1&nofb=1)

the default key mapping between Windows and Mac OS is unintuitive due to the relative placement of the respective keys. For example, if one tries to press Ctrl+Alt+Delete on Windows, they would have to send Ctrl+Option+Delete, not Ctrl+Command+Delete as the Windows keyboard's key placement would suggest.

So, this set of utilities can be used to:
* Swap the **Option** and **Command** keys on the MacBook before remotely accessing the Windows machine.
* And then restore the original **Option** and **Command** key mappings on the MacBook once finished with the Windows machine.

## Breakdown
* ModifyOptionCmdKeys.applescript
  * Common function for swapping or restoring the Option-Command key mappings on the MacBook.
  * Used by SwapOptionCmdKeys.applescript
    * Swap Option and Cmd keys on the MacBook to simulate the Windows keyboard's relative key placement.
  * Used by RetoreOptionCmdKeys.applescript
    * Restore the original MacBook relative key placement (a.k.a, undo the effects of SwapOptionCmdKeys.applescript).

### Standalone Version of SwapOptionCmdKeys.applescript
```
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

    click pop up button "Option (⌥) Key:" of sheet of window "Keyboard"
    click menu item "⌘ Command" of menu of pop up button "Option (⌥) Key:" of sheet of window "Keyboard"
    click pop up button "Command (⌘) Key:" of sheet of window "Keyboard"
    click menu item "⌥ Option" of menu of pop up button "Command (⌘) Key:" of sheet of window "Keyboard"
    click button "OK" of sheet of window "Keyboard"
end tell

tell application "System Preferences" to quit
```

### Standalone Version of RestoreOptionCmdKeys.applescript
```
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

    click pop up button "Option (⌥) Key:" of sheet of window "Keyboard"
    click menu item "⌥ Option" of menu of pop up button "Option (⌥) Key:" of sheet of window "Keyboard"
    click pop up button "Command (⌘) Key:" of sheet of window "Keyboard"
    click menu item "⌘ Command" of menu of pop up button "Command (⌘) Key:" of sheet of window "Keyboard"
    click button "OK" of sheet of window "Keyboard"
end tell

tell application "System Preferences" to quit
```
