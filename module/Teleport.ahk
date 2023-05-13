#Include ../core/Point.ahk
class Teleport {
    static teleportBtnRange := [
        Point(2245,950),
        Point(2355,990)
    ]
    static ChoiceBtnRange := [
        Point(1090,605),
        Point(1182,952)
    ]

    ; 获取是否存在包含“传送”两个字的按钮位置
    static getBtnIsOk(&targetX, &targetY){
        return ImageSearch(&targetX, &targetY, this.teleportBtnRange[1].x, this.teleportBtnRange[1].y, this.teleportBtnRange[2].x, this.teleportBtnRange[2].y, "*100 files\images\teleportBtn.png")
    }

    static fastTeleport(){
        isOkToTeleport := this.getBtnIsOk(&targetX, &targetY)
        ChoiceBtnExist := ImageSearch(&choiceTargetX, &choiceTargetY, this.ChoiceBtnRange[1].x, this.ChoiceBtnRange[1].y, this.ChoiceBtnRange[2].x, this.ChoiceBtnRange[2].y, "*100 files\images\teleport1.png")

        if(ChoiceBtnExist){
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