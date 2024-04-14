#Include ../core/Point.ahk
#Include ../core/Color.ahk
#Include ../core/Tools.ahk
; 遗器（圣遗物）
Class Artifact {
    static fitst := Point(Pos(781,350), Pos(451,347))
    static second := Point(Pos(0,0), Pos(1798,451))
    static color1 := Color("#f5f5f5")

    static Lock(){
        
        if (!this.LockInBackpack()) {
            this.LockInArtifact()
        }
        
    }

    ; 角色圣遗物界面
    static LockInArtifact(){
        targetX := 0, targetY := 0

        ; 检查目标点位是否存在相应的颜色
        if Tools.pixelExist(this.fitst, this.color1.c) {
            targetX := this.fitst.x
            targetY := this.fitst.y
        } else if Tools.pixelExist(this.second, this.color1.c) {
            targetX := this.second.x
            targetY := this.second.y
        }

        ; 执行加减锁操作
        if (targetX != 0 || targetY != 0) {
            MouseGetPos(&tempX,&tempY)
            MouseClick(, targetX, targetY, , 0)
            MouseMove(tempX,tempY,0)
            return true
        }
        return false
    }

    static IsInBackpackArtifact(){
        ; #TODO 设置21:9
        pointA := Point(Pos(0,0),Pos(838,47))
        pointA_color := Color("#e5e7e8")
        
        ; #TODO 设置21:9
        pointB := Point(Pos(0,0),Pos(1678,987))
        pointB_color := Color("#e1e0e0")

        tempA := Tools.pixelExist(pointA, pointA_color.c)
        tempB := Tools.pixelExist(pointB, pointB_color.c)

        return tempA && tempB
    }

    ; 背包界面
    static LockInBackpack(){
        
        ; 锁定按钮
        pointLockBtn := Point(Pos(0,0),Pos(1813,273))
        
        if (this.IsInBackpackArtifact()) {
            MouseGetPos(&x,&y)
            Tools.MClick(pointLockBtn, 0)
            MouseMove(x,y,0)
            return true
        }
        return false
    }
    
    ; 背包弃置
    static AbandonInBackpack(){
        
        ; 丢弃按钮
        pointAbandonBtn := Point(Pos(0,0),Pos(1813,328))

        if (this.IsInBackpackArtifact()) {
            MouseGetPos(&x,&y)
            Tools.MClick(pointAbandonBtn, 0)
            MouseMove(x,y,0)
            return true
        }
        return false

    }
}