; 推荐安装官网的统一新环境，可以兼容多版本的AHK，按以下格式声明版本即可（缺少的它会自动下载）
#Requires AutoHotkey v2.0
#SingleInstance Force

; Core
#Include core/StarRail.ahk
#Include core/Point.ahk
#Include core/Scenes.ahk
#Include core/PointExtractor.ahk

; Module
#Include module/BattlePass.ahk
#Include module/Teleport.ahk
#Include module/Achievement.ahk
#Include module/Assignments.ahk
#Include module/DailyTraining.ahk
#Include module/SimulatedUniverseIndex.ahk
#Include module/GetAllDailyRewards.ahk
#Include module/ThirdPartyTools.ahk
#Include module/Artifact.ahk
#Include module/Team.ahk

; Test
#Include test.ahk

; 脚本只在以下条件满足时执行
#HotIf StarRail.is_game_active()

; StarRail.get_game_pos()
; SetTimer () => StarRail.get_game_pos(), -3000

; 快速退出游戏
^Esc:: StarRail.close_game()

; 调试用功能，快速Reload脚本
^!r:: Reload

; 模拟宇宙快速强化
^Space::{
    MouseGetPos(&x,&y)
    strengthenBtn := Point(Pos(2284,987),Pos(1644,987))
    Tools.MClick(strengthenBtn)
    Sleep(200)
    SendInput('{Esc}')
    Sleep(500)
    SendInput('{Esc}')
    MouseMove(x,y)
}

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

; 还没适配16:9，最后再搞
^1::SimulatedUniverseIndex.EventReward()

^2::ThirdPartyTools.launch_tools()

!e::Artifact.Lock()

!d::Artifact.AbandonInBackpack()

; 调用nircmd调整星铁的音量
^3::ThirdPartyTools.adjust_volume()


; 在场景为大世界的时候启用以下功能
#HotIf StarRail.is_game_active() && Scenes.IsWorldScene()

^F1::Assignments.ClaimAssignmentsRewards()

^F2::BattlePass.ClaimBattlePassRewards()

^F3::Achievement.ClaimAchievementRewards()

^F4::DailyTraining.ClaimDailyTrainingRewards()

`::GetAllDailyRewards.ClaimAllRewards()

; 场景为地图时启用
#HotIf StarRail.is_game_active() && Scenes.IsMapScene()
^T::Teleport.fastTeleport()

#HotIf
!`::PointExtractor.getPoint()

!^`::PointExtractor.searchColor()

; =::Test.test()



; 拓展场景功能
#Include Keys1.ahk
#Include KeySwitch.ahk