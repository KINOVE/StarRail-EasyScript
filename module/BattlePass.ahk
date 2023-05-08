#Include ../core/Point.ahk
class BattlePass {
    static page1 := Point(1184, 60)
    static page2 := Point(1280, 60)

    static get_bp_awards(){
        SendInput('{F2}')
        Sleep(1000)
        ; MouseMove(this.page2.x, this.page2.y)
        MouseClick(, this.page2.x, this.page2.y)
        ; MsgBox('1')
    }
}