#Include ../core/Point.ahk
#Include ../core/Color.ahk
#Include ../core/Tools.ahk
#Include ../core/StarRail.ahk
; 每日实训（指南 -> 每日实训）
Class DailyTraining {

    ; 获取经验的按钮
    static p_claim_btn := Point(Pos(723, 820), Pos(389,820))
    static c_claim_btn := Color('#ffc85a')

    ; 奖励领取红点出现的区域
    static p_reward_range := [
        Point(Pos(956,267), Pos(404,255)),
        Point(Pos(1910,308), Pos(1655,374))
    ]
    static c_red := Color('#dc302c')

    ; 找到红点并领取奖励
    static find_and_click_to_claim_red_tips_reward(){
        targetx := 0, targety := 0
        while (Tools.pixelSearchPlus(this.p_reward_range[1], this.p_reward_range[2], this.c_red.c, &targetx, &targety)){
            MouseClick(, targetx - 10, targety + 10)
            MouseMove(300,300)
            Sleep(1000)
            SendInput('{Esc}')
            Sleep(800)
        }
    }

    ; 找到黄色Claim按钮并领取Exp
    static find_and_click_to_claim_exp(){
        targetx := 0, targety := 0
        if(!Tools.pixelExist(this.p_claim_btn, this.c_claim_btn.c, , , &targetx, &targety)){
            return Sleep(1500)
        }
        while (Tools.pixelExist(this.p_claim_btn, this.c_claim_btn.c, , , &targetx, &targety)){
            MouseClick(, targetx, targety)
            MouseMove(300,300)
            Sleep(800)
        }
    }

    static ClaimDailyTrainingRewards(){
        ToolTip("正在领取每日实训奖励", StarRail.game_size.width/2, StarRail.game_size.height * 9/10, 11)
        SendInput('{F4}')
        Sleep(1500)
        this.find_and_click_to_claim_exp()
        this.find_and_click_to_claim_red_tips_reward()
        SendInput('{Esc}')
        ToolTip("",,, 11)
    }

    static OnlyClaimDailyTrainingRewards(){
        ToolTip("正在领取每日实训奖励", StarRail.game_size.width/2, StarRail.game_size.height * 9/10, 11)
        Sleep(1500)
        this.find_and_click_to_claim_exp()
        this.find_and_click_to_claim_red_tips_reward()
        SendInput('{Esc}')
        Sleep(1500)
        ToolTip("",,, 11)
    }
}