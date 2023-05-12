#Include ../core/Point.ahk
class Teleport {
    static teleportBtnRange := [
        Point(2245,950),
        Point(2355,990)
    ]

    static fastTeleport(){
        isOk := ImageSearch(&targetX, &targetY, this.teleportBtnRange[1].x, this.teleportBtnRange[1].y, this.teleportBtnRange[2].x, this.teleportBtnRange[2].y, "*100 files\images\teleportBtn.png")
        if(isOk){
            MouseGetPos(&x, &y)
            MouseClick(, targetX, targetY, , 0)
            MouseMove(x, y, 0)
        }
    }
}