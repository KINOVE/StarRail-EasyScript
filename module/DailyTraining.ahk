#Include ../core/Point.ahk
#Include ../core/Color.ahk
#Include ../core/Tools.ahk
#Include ../core/StarRail.ahk

Class DailyTraining {

    ; 获取经验的按钮
    static p_claim_btn := Point(Pos(723, 774))
    static c_claim_btn := Color('#ffc85a')

    ; 奖励领取红点出现的区域
    static p_reward_range := [
        Point(Pos(956,267)),
        Point(Pos(1910,308))
    ]
    static c_red := Color('#dc302c')

    ; 找到红点并领取奖励
    static find_and_click_to_claim_red_tips_reward(){
        targetx := 0, targety := 0
        while (Tools.pixelSearchPlus(this.p_reward_range[1], this.p_reward_range[2], this.c_red.c, &targetx, &targety)){
            MouseClick(, targetx, targety)
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
            Sleep(800)
        }
    }

    static ClaimAll(){
        SendInput('{F4}')
        Sleep(1500)
        this.find_and_click_to_claim_exp()
        this.find_and_click_to_claim_red_tips_reward()
        SendInput('{Esc}')
    }
}