#Include ../core/Point.ahk
#Include ../core/Tools.ahk
#Include ../core/Color.ahk
#Include Assignments.ahk
#Include Achievement.ahk
#Include DailyTraining.ahk
#Include BattlePass.ahk
class GetAllDailyRewards {
    ; Assignments委托
    static RewardsRedTipAssignments := Point(Pos(2417, 319), Pos(1783, 319))
    ; Achievement成就
    static RewardsRedTipAchievement := Point(Pos(2420, 443))
    ; DailyTraining每日实训
    static RewardsRedTipDailyTraining := Point(Pos(2032,706))
    ; BattlePass通行证
    static RewardsRedTipBattlePass := Point(Pos(2160,575))

    ; 红色
    static RedColor := Color('#D32D29')

    ; 确定有哪些奖励可以领取
    static GetStatus(){
        SendInput('{Esc}')
        Sleep(1000)
        isAssignmentsRewardExist := Tools.pixelExist(this.RewardsRedTipAssignments, this.RedColor.c)
        isAchievementRewardExist := Tools.pixelExist(this.RewardsRedTipAchievement, this.RedColor.c)
        isDailyTrainingRewardExist := Tools.pixelExist(this.RewardsRedTipDailyTraining, this.RedColor.c)
        isBattlePassRewardExist := Tools.pixelExist(this.RewardsRedTipBattlePass, this.RedColor.c)


        if(isAssignmentsRewardExist){
            ; MsgBox('委托')
            Assignments.OnlyClaimAssignmentsRewards()
        }
        if(isAchievementRewardExist){
            MsgBox('成就')
        }
        if(isDailyTrainingRewardExist){
            ; MsgBox('每日实训')
            MouseClick(, this.RewardsRedTipDailyTraining.x - 10, this.RewardsRedTipDailyTraining.y + 10, , 1)
            DailyTraining.OnlyClaimDailyTrainingRewards()
        }   
        if(isBattlePassRewardExist){
            ; MsgBox('通行证')
            MouseClick(, this.RewardsRedTipBattlePass.x - 10, this.RewardsRedTipBattlePass.y + 10, , 1)
            BattlePass.OnlyClaimBattlePassRewards()
        }
        SendInput('{Esc}')

        if(isAchievementRewardExist || isAchievementRewardExist || isDailyTrainingRewardExist || isBattlePassRewardExist){
            ToolTip("所有奖励已被领取", StarRail.game_size.width/2, StarRail.game_size.height/2, 19)
            SetTimer () => ToolTip('',,,19), -3000
        }
        else{
            ToolTip("没有奖励需要领取", StarRail.game_size.width/2, StarRail.game_size.height/2, 19)
            SetTimer () => ToolTip('',,,19), -3000
        }
    }
}