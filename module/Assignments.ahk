#Include ../core/Point.ahk
#Include ../core/Color.ahk
#Include ../core/Tools.ahk
#Include ../core/StarRail.ahk

Class Assignments {
    static p_Assignments_Red_Tip := Point(Pos(2417, 319), Pos(1783, 319))
    static c_Assignments_Red_Tip := Color('#d62c2b')
    static p_Tabs_Red := [
        Point(Pos(888, 205), Pos(575, 205)),
        Point(Pos(1148, 205), Pos(835, 205)),
        Point(Pos(1408, 205), Pos(1096, 205))
    ]
    static c_Tabs_Red := Color('#d62d2b')

    static p_Child_Tabs_Red_Range := [
        Point(Pos(1095, 291), Pos(640, 291)),
        Point(Pos(1125, 883), Pos(804, 883))
    ]

    ; 以下两个可能不准确
    static p_Claim_Btn := Point(Pos(1675, 908), Pos(1474, 908))
    static p_repatch := Point(Pos(1372, 960), Pos(1138, 960))

    static refreshPos(){
        this.p_Assignments_Red_Tip.refresh_pos()
        this.p_Tabs_Red[1].refresh_pos()
        this.p_Tabs_Red[2].refresh_pos()
        this.p_Tabs_Red[3].refresh_pos()
        this.p_Child_Tabs_Red_Range[1].refresh_pos()
        this.p_Child_Tabs_Red_Range[2].refresh_pos()
        this.p_Claim_Btn.refresh_pos()
        this.p_repatch.refresh_pos()
    }

    static OnlyClaimAssignmentsRewards(){
        this.refreshPos()
        ToolTip("正在领取委托奖励", StarRail.game_size.width/2, StarRail.game_size.height * 9/10, 11)
        ; 打开Assignments页面
        MouseClick( , this.p_Assignments_Red_Tip.x, this.p_Assignments_Red_Tip.y)
        Sleep(1000)
        for p_Tab_Red in this.p_Tabs_Red{
            if(Tools.pixelExist(p_Tab_Red, this.c_Tabs_Red.c)){
                MouseClick( , p_Tab_Red.x, p_Tab_Red.y)
                Sleep(1000)
                targetx := 0, targety := 0
                while(Tools.pixelSearchPlus(this.p_Child_Tabs_Red_Range[1], this.p_Child_Tabs_Red_Range[2],this.c_Tabs_Red.c, &targetx, &targety)){
                    MouseClick( , targetx, targety + 10)
                    Sleep(200)
                    MouseClick(,this.p_Claim_Btn.x, this.p_Claim_Btn.y)
                    Sleep(1000)
                    MouseClick(,this.p_repatch.x, this.p_repatch.y)
                    Sleep(500)
                    SendInput('{Esc}')
                    Sleep(300)
                }
            }
        }
        SendInput('{Esc}')
        Sleep(1500)
        ToolTip("",,, 11)
    }

    static ClaimAssignmentsRewards(){
        this.refreshPos()
        SendInput('{Esc}')
        Sleep(1000)
        if (!Tools.pixelExist(this.p_Assignments_Red_Tip, this.c_Assignments_Red_Tip.c)){
            SendInput('{Esc}')
            ToolTip('没有新的委托奖励需要领取', StarRail.game_size.width/2, StarRail.game_size.height/2, 1)
            SetTimer () => ToolTip('',,1), -3000
            ToolTip("",,, 11)
            return
        }
        this.OnlyClaimAssignmentsRewards()
        SendInput('{Esc}')
    }
}