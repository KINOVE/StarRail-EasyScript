#Include ../core/Point.ahk
#Include ../core/Color.ahk
#Include ../core/Tools.ahk
; 遗器（圣遗物）
Class Artifact {
    static fitst := Point(Pos(781,350), Pos(451,347))
    static second := Point(Pos(0,0), Pos(1798,451))
    static color1 := Color("#f5f5f5")

    static Lock(){

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
        }
    }
}