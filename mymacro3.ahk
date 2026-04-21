; Controls:
; F2 = Start / Resume typing
; F3 = Pause and Save progress
; Esc = Stop and Save progress

global currentNum := 0
progressFile := "progress.txt"


if FileExist(progressFile) {
    currentNum := Number(FileRead(progressFile))
}

Esc:: {
    FileDelete(progressFile)
    FileAppend(string(currentNum), progressFile)
    ExitApp
}

F3:: {
    FileDelete(progressFile)
    FileAppend(string(currentNum), progressFile)
    Pause -1 ; 
}

F2::
{
    global currentNum
    Loop 10000000000 ; 10 Billion combinations
    {
        
        formattedStr := Format("{:010}", currentNum)
        
        SendText formattedStr
        Send "{Enter}"
        
        currentNum++ 
        
        
        if (currentNum > 9999999999) {
            MsgBox "All combinations finished!"
            break
        }
        
        Sleep 500
    }
}