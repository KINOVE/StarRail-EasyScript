#Include SRES.ahk
Class Test {
    static test(){
        ImageSearch(&choiceTargetX1, &choiceTargetY1, 0, 0, 1920, 1080, "*100 files\images\teleport1.png")
        Tools.MMove(Pos(choiceTargetX1,choiceTargetY1))
    }
}