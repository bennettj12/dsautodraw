
SetDefaultMouseSpeed, 0
SetMouseDelay, 1
SetBatchLines, -1

topLeftX := 500
topLeftY := 85
bottomRightX := 1350
bottomRightY := 980

imageWidth := 250
imageHeight := 250

^e:: 
    ExitApp, 1


^t::
MouseGetPos, topLeftX, topLeftY
MsgBox TopLeft X:%topLeftX% Y:%topLeftY%
return

^b::
MouseGetPos, bottomRightX, bottomRightY
MsgBox BotRight X:%bottomRightX% Y:%bottomRightY%
return

^q::
FileSelectFile, csvLoc
if WinExist("Different Strokes"){
    WinActivate 
    Loop, read, %csvLoc%
        {
            LineNumber := A_Index - 1
            lastColor := ""
            Loop, parse, A_LoopReadLine, ";"
            {
                xToClick := topLeftX + (A_Index/imageWidth)*(Abs(TopLeftX - BottomRightX))
                yToClick := topLeftY + (LineNumber/imageHeight)*(Abs(TopLeftY - BottomRightY))
                currentColor := A_LoopField
                if(currentColor != lastColor)
                {
                    if(lastColor == ""){
                        Click, Up
                    }
                    MouseMove, %xToClick%, %yToClick% , [-1]
                    Click, Up
                    ;Sleep, 25
                    switch currentColor
                    {
                        case "[255,255,255]":
                            ;White
                            Click, 110 448
                            lastColor := "[255,255,255]"
                            
                        case "[204,204,204]":
                            ;LightGray
                            Click, 186 448
                            lastColor := "[204,204,204]"
                        case "[71,71,71]":
                            ;DarkGray
                            Click, 286 448
                            lastColor := "[71,71,71]"
                        case "[0,0,0]":
                            ;Black
                            Click, 386 448
                            lastColor := "[0,0,0]"
                        case "[57,101,255]":
                            ;Orange
                            Click, 137 551
                            lastColor := "[57,101,255]"
                        case "[0,45,205]":
                            ;DarkOrange
                            Click, 140 615
                            lastColor := "[0,45,205]"
                        case "[0,228,255]":
                            ;Yellow
                            Click, 331 555
                            lastColor := "[0,228,255]"
                        case "[0,180,202]":
                            ;DarkYellow
                            Click, 321 610
                            lastColor := "[0,180,202]"
                        case "[54,242,0]":
                            ;Green
                            Click, 132 677
                            lastColor := "[54,242,0]"
                        case "[42,197,0]":
                            ;DarkGreen
                            Click, 143 747
                            lastColor := "[42,197,0]"
                        case "[238,181,0]":
                            ;Blue
                            Click, 320 682
                            lastColor := "[238,181,0]"
                        case "[0,180,202]":
                            ;DarkBlue
                            Click, 320 732
                            lastColor := "[0,180,202]"
                        case "[255,82,168]":
                            ;Purple
                            Click, 144 795
                            lastColor := "[255,82,168]"
                        case "[182,59,121]":
                            ;DarkPurple
                            Click, 149 865
                            lastColor := "[182,59,121]"
                        case "[219,177,255]":
                            ;Pink
                            Click, 321 804
                            lastColor := "[219,177,255]"
                        case "[164,122,200]":
                            ;DarkPink
                            Click, 330 856
                            lastColor := "[164,122,200]"
                    }
                    Click, down, %xToClick%, %yToClick%
                }
            }
        }
}
    
Else
{
    MsgBox, % "Game Window Not Found"
    return
}

return