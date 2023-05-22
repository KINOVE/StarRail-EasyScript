#Include Pos.ahk

class Point {
    __New(pos219 := Pos(), pos169 := Pos()) {
        this.pos169 := pos169
        this.pos219 := pos219
        this.x := pos219.x
        this.y := pos219.y
    }

    refresh_pos() {
        game_width := StarRail.game_size.width
        game_height := StarRail.game_size.height
        if(this.x == '' || this.y == ''){
            MsgBox('刷新点位坐标失败，请检查脚本 => 脚本已暂停，修改后请按Ctrl+Alt+R重置脚本状态')
            Pause
        }

        switch game_width/game_height {
            ; 21:9中：不同分辨率下误差不一样
            ; 2560/1080 = 2.3703703703703703703703703703704
            ; 3440/1440 = 2.3888888888888888888888888888889
            ; 21/9中：全部一致
            ; 2560/1440 = 1920/1080 = 21/9 = 2.3333333333333333333333333333333
            case 2560/1080:
                this.x := this.pos219.x * game_width / 2560
                this.y := this.pos219.y * game_height / 1080
            case 3440/1440:
                this.x := this.pos219.x * game_width / 2560
                this.y := this.pos219.y * game_height / 1080
            case 16/9:
                this.x := this.pos169.x * game_width / 1920
                this.y := this.pos169.y * game_height / 1080
            default:
                MsgBox("当前暂不支持的分辨率：" . game_width . '/' . game_height)
        }
    }
}