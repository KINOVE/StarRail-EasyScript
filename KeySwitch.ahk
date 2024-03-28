#Include SRES.ahk
global FuncSwitch := true
#HotIf StarRail.is_game_active()
^a::{
    global FuncSwitch := !FuncSwitch
    width := 0
    height := StarRail.game_size.height/2
    if FuncSwitch == false {
        ToolTip('关闭', width, height, 20)
    } else {
        ToolTip('', , , 20)
    }
}
#HotIf StarRail.is_game_active() && FuncSwitch == true

; 连续按下Space
Space:: {
    SendInput('{Space}')
}
Space Up:: {
    SendInput('{Space Up}')
}