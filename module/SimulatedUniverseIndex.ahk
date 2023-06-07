#Include ../core/Point.ahk
#Include ../core/Tools.ahk
#Include ../core/Color.ahk
; 如果mhy优化了模拟宇宙奖励的一键领取，那么这个功能就不再有必要存在了
Class SimulatedUniverseIndex{
    static rewardBtnRange := [
        Point(Pos(2394, 884)),
        Point(Pos(2515,1006))
    ]
    static rewardBtnColor := Color('#fbefd2')
    static rewardRedTabRange := [
        Point(Pos(496,108)),
        Point(Pos(559,1023))
    ]
    static rewardRedTabColor := Color('#d62d2b')

    static drageRange := [
        Point(Pos(301, 927)),
        Point(Pos(301,161))
    ]

    static DragToNextPage(){
        ; MouseClickDrag("L",this.drageRange[1].x, this.drageRange[1].y, this.drageRange[2].x, this.drageRange[2].y, 10)
        MouseClick("L", this.drageRange[1].x, this.drageRange[1].y, , , "D")
        MouseMove(this.drageRange[2].x, this.drageRange[2].y)
        Sleep(500)
        MouseClick("L", this.drageRange[2].x, this.drageRange[2].y, , , "U")
        targetx := 0, targety := 0
        if(Tools.pixelSearchPlus(this.rewardRedTabRange[1], this.rewardRedTabRange[2], this.rewardRedTabColor.c, &targetx, &targety)){
            this.FindAndGetThisPageReward()
        }
        else{
            ToolTip("奖励领取完成", StarRail.game_size.width/2, StarRail.game_size.height*9/10, 11)
            SetTimer () => ToolTip("", , ,11), -3000
        }
    }

    static FindAndGetThisPageReward(){
        targetx := 0, targety := 0
        ; if(!Tools.pixelSearchPlus(this.rewardRedTabRange[1], this.rewardRedTabRange[2], this.rewardRedTabColor.c, &targetx, &targety)){
        ;     this.DragToNextPage()
        ; }
        while(Tools.pixelSearchPlus(this.rewardRedTabRange[1], this.rewardRedTabRange[2], this.rewardRedTabColor.c, &targetx, &targety)){
            MouseClick(,targetx, targety)
            Sleep(100)
            rewardx := 0, rewardy := 0
            if(!Tools.pixelSearchPlus(this.rewardBtnRange[1], this.rewardBtnRange[2], this.rewardRedTabColor.c, &rewardx, &rewardy, 100)){
                return this.DragToNextPage()
            }
            MouseClick(,rewardx + 10, rewardy + 10)
            Sleep(700)
            SendInput("{Esc}")
            Sleep(500)
        }
        this.DragToNextPage()
    }

    static EventReward(){
        ; 请确保处于模拟宇宙奖励领取界面
        ; return this.DragToNextPage()
        this.FindAndGetThisPageReward()
        
    }
}