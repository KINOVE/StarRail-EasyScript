#include ../core/StarRail.ahk

; 用于启动/关闭/重启一些第三方小工具
class ThirdPartyTools {
    static tool_names := [
        "HSR-Unlock.exe"
    ]
    static tool_dir := [
        "E:\Tools\StarRail\HSR-Unlock.exe"
    ]
    static volume := 50

    ; 开启第三方工具
    static launch_tools(){
        if(PID := ProcessExist(this.tool_names[1])){ ; 假如存在进程，获取其PID
            ; MsgBox(PID)
            ProcessClose(this.tool_names[1])    ; 关闭进程，等待重新打开
            ProcessClose(PID)
        }
        ; 打开程序
        Run(this.tool_dir[1])
    }

    ; 调整游戏音量(50%和0之间互相切换)
    static adjust_volume(){
        ; -------------------------------------------------------------
        ; 已失效：无法直接通过StarRail.exe进程名称来搜索，现改为使用ps1脚本执行
        ; Run "nircmd muteappvolume StarRail.exe 2"
        ; -------------------------------------------------------------

        ; 目前没有一个好的办法解决ps1脚本的弹出窗口，之后再想想办法。
        ; ps1_Path := '"' . A_ScriptDir . "\module\VolumeControl.ps1" . '"'
        ; Run "powershell.exe -WindowStyle Hidden -NoProfile -NonInteractive -ExecutionPolicy Bypass -File " . ps1_Path

        Run "nircmd muteappvolume /" . StarRail.get_pid() . " 2"
        
    }
}