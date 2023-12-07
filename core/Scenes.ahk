#Include StarRail.ahk
#Include Point.ahk
#Include Color.ahk
#Include Tools.ahk
Class Scenes{
    ; 该类用来识别当前所处的场景

    static IsWorldScene(){
        static worldPoints := [
            Point(Pos(43, 82), Pos(43, 82)),

        ]
        static worldColors :=[
            Color("#e7e7e7"),

        ]

        while (A_Index <= worldPoints.Length){
            worldPoints[A_Index].refresh_pos()
            if(!Tools.pixelExist(worldPoints[A_Index], worldColors[A_Index].c)){
                return false
            }
        }

        return true
    }

    static IsMapScene(){
        static mapPoints := [
            Point(Pos(68, 71), Pos(68, 71)),
        ]
        static mapColors := [
            Color("#000000"),
        ]

        while (A_Index <= mapPoints.Length){
            mapPoints[A_Index].refresh_pos()
            if(!Tools.pixelExist(mapPoints[A_Index], mapColors[A_Index].c)){
                return false
            }
        }
        
        return true
    }

    static IsTeamScene(){
        static Points := [
            Point(Pos(68,48), Pos(70,50)),
            Point(Pos(2503,66),Pos(1864,66)),
        ]
        static Colors := [
            Color("#E7CA95"),
            Color("#FFFFFF"),
        ]

        while (A_Index <= Points.Length){
            Points[A_Index].refresh_pos()
            if(!Tools.pixelExist(Points[A_Index], Colors[A_Index].c)){
                return false
            }
        }
        
        return true
    }

    static GetScene(){
        ; 1:游戏主界面
        ; 2:地图界面
        ; 3:队伍界面

        if(this.IsWorldScene())
            return 1
        else if (this.IsMapScene())
            return 2
        else if (this.IsTeamScene())
            return 3
        else
            return 0

    }
}