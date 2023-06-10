#Include ../core/Point.ahk
class Teleport {
    static teleportBtnRange := [
        Point(Pos(2245,950)),
        Point(Pos(2355,990))
    ]
    static ChoiceBtnRange := [
        Point(Pos(1090,605)),
        Point(Pos(1182,952))
    ]

    ; 获取是否存在包含“传送”两个字的按钮位置
    static getBtnIsOk(&targetX, &targetY){
        return ImageSearch(&targetX, &targetY, this.teleportBtnRange[1].x, this.teleportBtnRange[1].y, this.teleportBtnRange[2].x, this.teleportBtnRange[2].y, "*100 files\images\teleportBtn.png")
    }

    static fastTeleport(){
        isOkToTeleport := this.getBtnIsOk(&targetX, &targetY)
        ChoiceBtnExist_1 := ImageSearch(&choiceTargetX1, &choiceTargetY1, this.ChoiceBtnRange[1].x, this.ChoiceBtnRange[1].y, this.ChoiceBtnRange[2].x, this.ChoiceBtnRange[2].y, "*100 files\images\teleport1.png")
        ChoiceBtnExist_2 := ImageSearch(&choiceTargetX2, &choiceTargetY2, this.ChoiceBtnRange[1].x, this.ChoiceBtnRange[1].y, this.ChoiceBtnRange[2].x, this.ChoiceBtnRange[2].y, "*100 files\images\teleport2.png")
        
        if(ChoiceBtnExist_1 && !ChoiceBtnExist_2){
            choiceTargetX := choiceTargetX1
            choiceTargetY := choiceTargetY1
        }
        else if (!ChoiceBtnExist_1 && ChoiceBtnExist_2){
            choiceTargetX := choiceTargetX2
            choiceTargetY := choiceTargetY2
        }
        else if(ChoiceBtnExist_1 && ChoiceBtnExist_2){
            choiceTargetX := Min(choiceTargetX1, choiceTargetX2)
            choiceTargetY := Min(choiceTargetY1, choiceTargetY2)
        }

        if(ChoiceBtnExist_1 || ChoiceBtnExist_2){
            MouseGetPos(&x, &y)
            MouseClick(, choiceTargetX, choiceTargetY, , 0)
            MouseMove(x, y, 0)
            Sleep(200)
            isOkToTeleport := this.getBtnIsOk(&targetX, &targetY)
        }

        if(isOkToTeleport){
            MouseGetPos(&x, &y)
            MouseClick(, targetX, targetY, , 0)
            MouseMove(x, y, 0)
        }
    }
}