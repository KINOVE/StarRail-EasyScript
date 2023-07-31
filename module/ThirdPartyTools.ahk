; 用于启动/关闭/重启一些第三方小工具
class ThirdPartyTools {
    static tool_names := [
        "HSR-Unlock.exe"
    ]
    static tool_dir := [
        "E:\Tools\StarRail\HSR-Unlock.exe"
    ]

    static launch_tools(){
        if(PID := ProcessExist(this.tool_names[1])){ ; 假如存在进程，获取其PID
            ; MsgBox(PID)
            ProcessClose(this.tool_names[1])    ; 关闭进程，等待重新打开
            ProcessClose(PID)
        }
        ; 打开程序
        Run(this.tool_dir[1])
    }
}