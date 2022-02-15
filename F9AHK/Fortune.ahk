;;Fortune Cookie
fortunes := Array()
LoadFortunes(){
    fortuneFile := FileOpen("%A_ScriptDir%/fortune", "R")
    textblock := ""
    progress,Show
    While(!fortuneFile.AtEOF)
    {
        TextLine := fortuneFile.ReadLine()
        if(TextLine = "`%")
        {
        fortunes.Push(TextBlock)
        textblock := ""
        }
        else
        {
            textblock := textblock . "`r`n'" . TextLine
        }
    }
}

::.fortune::
    if (fortunes.MaxIndex() < 1) {
        LoadFortunes()
    }

return