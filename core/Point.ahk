#Include Pos.ahk
#Include StarRail.ahk

class Point {
    __New(pos219 := Pos(), pos169 := Pos()) {
        this.pos169 := pos169
        this.pos219 := pos219
        this.x := pos219.x
        this.y := pos219.y
        this.refresh_pos()  ;改为自动刷新 -> 为什么我之前没想到在这里刷新???,麻了
    }

    set(x,y) {
        this.x := x
        this.y := y
    }

    ; 刷新点位数据
    refresh_pos() { 
        while (!StarRail.is_game_exist()) || (StarRail.game_size.width == 0 || StarRail.game_size.height == 0) {
            Sleep(500)
            StarRail.get_game_pos()
        }
        game_width := StarRail.game_size.width
        game_height := StarRail.game_size.height
        if(game_width == 0 || game_height == 0){
            MsgBox('游戏分辨率获取失败 => 脚本已暂停, debug后请按Ctrl+Alt+R重置脚本状态')
            Pause
        }

        switch game_width/game_height {
            ; 21:9中：不同分辨率下误差不一样
            ; 2560/1080 = 2.3703703703703703703703703703704
            ; 3440/1440 = 2.3888888888888888888888888888889
            ; 21/9中：全部一致
            ; 2560/1440 = 1920/1080 = 21/9 = 2.3333333333333333333333333333333
            case 2560/1080:
                if(this.pos219.x == '' || this.pos219.y == ''){
                    this.set(0,0)
                    return
                    ; MsgBox('尚未设置符合要求的21:9点位坐标, 脚本已暂停, debug后请按Ctrl+Alt+R重置脚本状态')
                    ; Pause
                }
                this.x := this.pos219.x * game_width / 2560
                this.y := this.pos219.y * game_height / 1080
            case 3440/1440:
                if(this.pos219.x == '' || this.pos219.y == ''){
                    this.set(0,0)
                    return
                    ; MsgBox('尚未设置符合要求的21:9点位坐标, 脚本已暂停, debug后请按Ctrl+Alt+R重置脚本状态')
                    ; Pause
                }
                this.x := this.pos219.x * game_width / 2560
                this.y := this.pos219.y * game_height / 1080
            case 16/9:
                if(this.pos169.x == '' || this.pos169.y == ''){
                    this.set(0,0)
                    return
                    ; MsgBox('尚未设置符合要求的16:9点位坐标, 脚本已暂停, debug后请按Ctrl+Alt+R重置脚本状态')
                    ; Pause
                }
                this.x := this.pos169.x * game_width / 1920
                this.y := this.pos169.y * game_height / 1080
            default:
                MsgBox("当前暂不支持的分辨率：" . game_width . '/' . game_height)
        }

        if(this.x == '' || this.y == ''){
            MsgBox('刷新点位坐标失败，请检查脚本 => 脚本已暂停, debug后请按Ctrl+Alt+R重置脚本状态')
            Pause
        }
    }
}