#Include ../core/Point.ahk
class Teleport {
    ; 传送按钮会出现的区域
    static teleportBtnRange := [
        Point(Pos(2222,956), Pos(1567, 950)),
        Point(Pos(2355,990), Pos(1722, 990))
    ]
    ; 目标选择按钮出现的区域
    static ChoiceBtnRange := [
        Point(Pos(1090,605), Pos(780, 653)),
        Point(Pos(1182,952), Pos(858, 954))
    ]
    ; 二次确认框中按钮出现的位置
    static CheckBtn := Point(Pos(1465, 673), Pos(1141, 673))

    ; 检查是否有 "开始追踪" 按钮存在
    static IsTrackingBtnExist(&targetX,&targetY,BtnRange){
        images := [
            "files\images\teleportBtn2.png",
            "files\images\startTracking.bmp",
            "files\images\startTracking2.png"
        ]
        for image in images {
            if(ImageSearch(&targetX,&targetY,BtnRange[1].x,BtnRange[1].y,BtnRange[2].x,BtnRange[2].y,"*100 " . image) == true){
                return true
            }
        }
        return false
    }

    ; 获取是否存在包含“传送”两个字的按钮位置
    static getBtnIsOk(&targetX, &targetY){
        targetX1 := 0, targetX2 := 0
        targetY1 := 0, targetY2 := 0
        target1 := ImageSearch(&targetX1, &targetY1, this.teleportBtnRange[1].x, this.teleportBtnRange[1].y, this.teleportBtnRange[2].x, this.teleportBtnRange[2].y, "*100 files\images\teleportBtn.png")
        target2 := this.IsTrackingBtnExist(&targetX2,&targetY2,this.teleportBtnRange)

        if (target1){
            targetX := targetX1
            targetY := targetY1
            return true
        }
        else if (target2){
            targetX := targetX2
            targetY := targetY2
            return 2
        }

        return false
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

        switch isOkToTeleport {
            case 1:
                MouseGetPos(&x, &y)
                MouseClick(, targetX, targetY, , 0)
                MouseMove(x, y, 0)
            case 2:
                MouseGetPos(&x, &y)
                MouseClick(, targetX, targetY, , 0)
                Sleep(300)
                MouseClick(, this.CheckBtn.x, this.CheckBtn.y, , 0)
                Sleep(300)
                MouseMove(x, y, 0)
        }
    }
}