#Include ../core/Point.ahk
#Include ../core/Tools.ahk
#Include ../core/Color.ahk
class BattlePass {
    static page1 := Point(1203, 41)
    static page2 := Point(1299, 41)
    static page1_Btn := Point(1158, 65)
    ; static page1_Btn_color := '0xE9E9E9'
    static page1_Btn_color := Color('#e9e9e9')
    static page_red_color := Color('#D32D29')
    static page2_one_click_fetch_btn := Point(2190, 917)
    static btn_yellow_color := Color('#ffc85b')
    static page2_Btn := Point(1261, 63)
    static page2_Btn_color := Color('#e8ebe8')
    static page1_one_click_fetch_btn := Point(1992,921)
    
    ; 检查page1是否存在奖励需要领取，并
    static get_page1_awards(){
        if(!Tools.pixelExist(this.page1, this.page_red_color.c)){
            return
        }
        ; 切换到第一页
        MouseClick( , this.page1.x, this.page1.y, , 0)
        Sleep(500)
        ; 点击获取奖励
        MouseClick( , this.page1_one_click_fetch_btn.x, this.page1_one_click_fetch_btn.y, , 0)
        Sleep(500)
        ; 退出奖励获取界面
        SendInput('{Esc}')
        Sleep(500)
        ; 退出纪行
        SendInput('{Esc}')
    }

    static check_is_upgrade(){
        if(PixelGetColor(this.page2_Btn.x, this.page2_Btn.y) == this.page2_Btn_color.c)
            return true
        else
            return false
    }

    static check_is_battle_pass_page(){
        if(PixelGetColor(this.page1_Btn.x, this.page1_Btn.y) == this.page1_Btn_color.c)
            return true
        else
            return false
    }

    static get_bp_awards(){
        SendInput('{F2}')
        Sleep(1500)
        if(!this.check_is_battle_pass_page()){
            MsgBox(PixelGetColor(this.page1_Btn.x, this.page1_Btn.y))
            ToolTip('并未打开纪行页面，请确保处于游戏主界面', StarRail.game_size.width/2, StarRail.game_size.height/2, 1)
            SetTimer () => ToolTip('',,1), -3000
            return
        }
        if(!Tools.pixelExist(this.page2, this.page_red_color.c)){
            ; Page2不存在红点，开始检查Page1
            this.get_page1_awards()
            ToolTip('没有需要领取的奖励', StarRail.game_size.width/2, StarRail.game_size.height/2, 1)
            SetTimer () => ToolTip('',,1), -3000
            SendInput('{Esc}')
            return
        }
        MouseClick(, this.page2.x, this.page2.y)
        Sleep(1000)
        MouseClick( , this.page2_one_click_fetch_btn.x, this.page2_one_click_fetch_btn.y, , 0)
        Sleep(1500)
        ; 假如没有升级界面弹出/page2激活的按钮没有被遮挡
        if(!this.check_is_upgrade()){
            SendInput('{Esc}')
            return
        }
        ; 退出升级界面
        SendInput('{Esc}')
        Sleep(500)
        this.get_page1_awards()
    }
}