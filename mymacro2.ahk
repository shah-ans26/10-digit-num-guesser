; Controls:
; F2 = Start typing
; F3 = Pause / Resume
; Esc = Stop script completely

Esc::ExitApp
F3::Pause

F2::
{
    Loop 999999999
    {
        ; Generates the 10-digit number
        randomStr := Format("{:010}", Random(0, 9999999999))
        
        SendText randomStr
        Send "{Enter}"
        Sleep 500
    }
}