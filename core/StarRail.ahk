
Class StarRail{
    static game_name := 'StarRail.exe'
    static game_size := {
        width : 0,
        height : 0
    }

    static get_game_pos(){
        if(ProcessExist(this.game_name) && this.is_game_active()){
            WinGetClientPos( , , &width, &height, 'ahk_exe' this.game_name)
            this.game_size.width := width
            this.game_size.height := height
            return
        }
        this.game_size.width := 0
        this.game_size.height := 0
    }

    static is_game_active(){
        return WinActive('ahk_exe ' this.game_name)
    }

    static close_game(){
        if WinExist('ahk_exe ' this.game_name)
            WinClose
        ExitApp
    }
}