#SingleInstance On

confirm := "Numpad0"                    ; Keybind > System > Confirm
cycleDownThroughPartyList := "Numpad7"  ; Keybind > System > Move Cursor down/Cycle down through Party list
cycleUpThroughPartyList := "Numpad9"    ; Keybind > System > Move Cursor up/Cycle up through Party list
targetCursorRight := "Numpad6"          ; Keybind > System > Move Cursor/Target Cursor Right

; Find the exact key name here:
;   https://www.autohotkey.com/docs/KeyList.htm

keys := [confirm, cycleDownThroughPartyList, cycleUpThroughPartyList, targetCursorRight]

Numpad1::
    SoundBeep, 200, 70 ; Comment out if you don't want to hear the noise indicator
    Input, num, L1
    Instance(num, keys)
    Return

Instance(zone, keys)
{
    BlockInput MouseMove ; Block mouse movements for a fraction of a section to send inputs since mouse movement will switch back to M+K/B setup
    send % "{" keys[1] "}"
    sleep 10
    send % "{" keys[1] "}"
    sleep 1000
    send % "{" keys[4] "}"
    send % "{" keys[3] "}"
    send % "{" keys[3] "}"
    send % "{" keys[1] "}"
    sleep 50
    loop, %zone%
    {
        send % "{" keys[2] "}"
    }
    send % "{" keys[1] "}"
    BlockInput MouseMoveOff 
}