Class Color{
    __New(colorId) {
        this.c := '0x' . StrUpper(SubStr(colorId, 2, 6))
        ; if(InStr(colorId,'#') == 1){
        ;   this.c := '0x' . StrUpper(SubStr(colorId, 2, 6))
        ; }
    }
}