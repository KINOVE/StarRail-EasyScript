; 用于启动/关闭/重启一些第三方小工具
class ThirdPartyTools {
    static tool_names := [
        "HSR-Unlock.exe"
    ]
    static tool_dir := [
        "E:\Tools\StarRail\HSR-Unlock.exe"
    ]

    static launch_tools(){
        if(ProcessExist(this.tool_names[1])){
            ; MsgBox(this.tool_names[1])
            return
        }
        ; 如果不存在 -> 没有打开程序
        Run(this.tool_dir[1])
    }
}