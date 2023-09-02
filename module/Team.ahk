#Include ../core/Color.ahk
#Include ../core/Point.ahk
#Include ../core/StarRail.ahk
#Include ../core/Tools.ahk
Class Team{

    static LastTeamPos := Point(Pos(0,0),Pos(88,519))
    static NextTeamPos := Point(Pos(0,0),Pos(1833,518))
    static ConfirmPos := Point(Pos(0,0),Pos(1666,984))
    ; 切换到上一个队伍
    static LastTeam(){
        ; this.ClickTemplate(this.LastTeamPos)
        Tools.MClick(this.LastTeamPos)
    }
    
    ; 切换到下一个队伍
    static NextTeam(){
        ; this.ClickTemplate(this.NextTeamPos)
        Tools.MClick(this.NextTeamPos)
    }
    
    ; 确认
    static Confirm(){
        this.ClickTemplate(this.ConfirmPos)
        ; Tools.MClick(this.ConfirmPos)
    }

    static ClickTemplate(target){
        MouseGetPos(&x,&y)
        Tools.MClick(target)
        ; Sleep(20)
        Tools.MMove(Pos(x,y))
        ; Tools.MClick(target)
    }
}