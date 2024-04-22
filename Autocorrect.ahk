#Requires AutoHotkey v2.0-a

saveAndClose() {
    global MyGui
    global correctText
    newCommand := "::" . highlightedText . "::" . correctText.Text	
    FileAppend(newCommand . "`n", "typos.ahk",  "UTF-8")
    MyGui.Hide
    replaceTextUnderCursor()
    Run "typos.ahk"
}

checkMarkedWord() {
    global MyGui
    global correctText
    global highlightedText
	global fileText
    
    highlightedText := getHighlightedText()
    fileText:= FileRead("typos.ahk")

    if(!InStr(fileText, highlightedText)) {
        MyGui := Gui()
        MyGui.Add("Text",, "Correct this text: " . highlightedText)
        correctText:= MyGui.AddEdit()
        MyGui.Show    
    }
	replaceTextUnderCursor()
}

replaceTextUnderCursor() {
    global highlightedText
	global fileText

    Loop Parse, fileText, "`n" {
        if(InStr(A_LoopField, highlightedText)) {
            paste(StrSplit(A_LoopField, "::")[3]) 
            break 
        }
    }
}

paste(data) {
    bak := ClipboardAll()
    A_Clipboard := data
    Send("^v")
    Loop
        Sleep(50)
    Until !DllCall("GetOpenClipboardWindow", "Ptr") || (A_Index > 20)
    A_Clipboard := bak
}

getHighlightedText() {
    ClipSaved := ClipboardAll()
    SendEvent "^c"
    return A_Clipboard
}

Run "typos.ahk"
Ctrl & Q::saveAndClose()
Ctrl & R::checkMarkedWord()