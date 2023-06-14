#Include StarRail.ahk
#Include Point.ahk
#Include Color.ahk
#Include Tools.ahk
Class Scenes{
    ; 该类用来识别当前所处的场景

    static IsWorldScene(){
        static worldPoints := [
            Point(Pos(43, 82)),

        ]
        static worldColors :=[
            Color("#e7e7e7"),

        ]

        while (A_Index <= worldPoints.Length){
            if(!Tools.pixelExist(worldPoints[A_Index], worldColors[A_Index].c)){
                return false
            }
        }

        return true
    }

    static IsMapScene(){
        static mapPoints := [
            Point(Pos(68, 71)),
        ]
        static mapColors := [
            Color("#000000"),
        ]

        while (A_Index <= mapPoints.Length){
            if(!Tools.pixelExist(mapPoints[A_Index], mapColors[A_Index].c)){
                return false
            }
        }
        
        return true
    }


    static GetScene(){
        ; 1:游戏主界面
        ; 2:地图界面

        if(this.IsWorldScene()){
            return 1
        }
        else if (this.IsMapScene()){
            return 2
        }
        else{
            return 0
        }

    }
}