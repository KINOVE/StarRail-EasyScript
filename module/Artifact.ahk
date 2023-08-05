#Include ../core/Point.ahk
#Include ../core/Color.ahk
#Include ../core/Tools.ahk
Class Artifact {
    static fitst := Point(Pos(781,350))
    static color1 := Color("#f5f5f5")

    static Lock(){
        if Tools.pixelExist(this.fitst,this.color1.c){
            MouseGetPos(&tempX,&tempY)
            MouseClick(, this.fitst.x, this.fitst.y, , 0)
            MouseMove(tempX,tempY,0)
        }
    }
}