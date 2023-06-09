#Include ../core/Point.ahk
#Include ../core/Tools.ahk
Class Achievement{
    
    static isRewardsExistPoint := Point(Pos(2420, 443))
    static centerBtnPoint := Point(Pos(1272, 417))
    static redTabsRange := [
        Point(Pos(848, 22)),
        Point(Pos(1714, 60))
    ]
    static getRewardsBtnPoint := Point(Pos(2348, 308))

    static OnlyClaimAchievementRewards(){
        Sleep(1000)
        MouseClick( , this.centerBtnPoint.x, this.centerBtnPoint.y, , 0)
        Sleep(1000)
        targetX := 0, targetY := 0
        while (Tools.pixelSearchPlus(this.redTabsRange[1], this.redTabsRange[2], '0xd62d2c', &targetX, &targetY)){
            MouseClick( , targetX, targetY, , 0)
            Sleep(300)
            while(Tools.pixelExist(this.getRewardsBtnPoint, '0xffc657')){
                MouseClick( , this.getRewardsBtnPoint.x, this.getRewardsBtnPoint.y, , 0)
                MouseMove(300,300,0)
                Sleep(700)
                SendInput('{Esc}')
                Sleep(800)
            }
        }
        SendInput('{Esc}')
        Sleep(500)
        SendInput('{Esc}')
        Sleep(1000)
    }

    static ClaimAchievementRewards(){
        ToolTip("正在领取成就奖励", StarRail.game_size.width/2, StarRail.game_size.height * 9/10, 11)
        SendInput('{Esc}')
        Sleep(1000)
        if (!Tools.pixelExist(this.isRewardsExistPoint, '0xd62d2c')){
            SendInput('{Esc}')
            ToolTip('没有新的成就奖励需要领取', StarRail.game_size.width/2, StarRail.game_size.height/2, 1)
            SetTimer () => ToolTip('',,1), -3000
            ToolTip("",,, 11)
            return
        }
        MouseClick( , this.isRewardsExistPoint.x, this.isRewardsExistPoint.y, , 0)
        this.OnlyClaimAchievementRewards()
        SendInput('{Esc}')
        Sleep(1000)
        ToolTip("",,, 11)
    }
}