; 推荐安装官网的统一新环境，可以兼容多版本的AHK，按以下格式声明版本即可（缺少的它会自动下载）
#Requires AutoHotkey v2.0
#SingleInstance

/* Core */
#Include core/StarRail.ahk
#Include core/Point.ahk
/* Module */
#Include module/BattlePass.ahk

; 脚本只在以下条件满足时执行
#HotIf StarRail.is_game_active()

StarRail.get_game_pos()

; 快速退出游戏
^Esc:: StarRail.close_game()

; 调试用功能，快速Reload脚本
^!r:: Reload

; !1::{
;     StarRail.get_game_pos()
;     MsgBox(StarRail.game_size.width)
; }

^F2::BattlePass.get_bp_awards()