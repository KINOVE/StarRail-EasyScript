; 推荐安装官网的统一新环境，可以兼容多版本的AHK，按以下格式声明版本即可（缺少的它会自动下载）
#Requires AutoHotkey v2.0
#SingleInstance Force

; Core
#Include core/StarRail.ahk
#Include core/Point.ahk

; Module
#Include module/BattlePass.ahk
#Include module/Teleport.ahk
#Include module/Achievement.ahk
#Include module/Assignments.ahk
#Include module/DailyTraining.ahk

; 脚本只在以下条件满足时执行
#HotIf StarRail.is_game_active()

StarRail.get_game_pos()
; SetTimer () => StarRail.get_game_pos(), 3000
SetTimer () => StarRail.get_game_pos(), -12000

; 快速退出游戏
^Esc:: StarRail.close_game()

; 调试用功能，快速Reload脚本
^!r:: Reload

; 连跳
Space:: {
    SendInput('{Space}')
}
Space Up:: SendInput('{Space Up}')

; 鼠标快速连点
^!LButton::{
    Click
    clickPlus(){
        if GetKeyState('LButton','P'){
            Sleep(Random(100,150))
            Click
        } else {
            SetTimer(clickPlus, 0)
        }
    }
    SetTimer(clickPlus, 50)
}

^F1::Assignments.Claim_All()

^F2::BattlePass.get_bp_awards()

^F3::Achievement.get_achievement_rewards()

^F4::DailyTraining.ClaimAll()

`::{
    Assignments.Claim_All()
    Sleep(1000)
    BattlePass.get_bp_awards()
    Sleep(1000)
    Achievement.get_achievement_rewards()
    Sleep(1000)
    DailyTraining.ClaimAll()
}


^T::Teleport.fastTeleport()