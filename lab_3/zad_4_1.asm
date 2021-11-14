wait:
    JNB P3.0, start
    JMP wait

start:
    MOV P2, #0FFh
    MOV TH0,#76
    MOV TL0,#01
    MOV TMOD,#01 ; 16-bitowy timer 0
    SETB TR0 ; startujemy timer 0
    JNB TF0,$
    INC A
    CLR TF0
    JNB P3.0, start
    MOV R3, A
reset_diody:
    MOV A, R3
    MOV R0, A
diody:
    MOV TH0,#76
    MOV TL0,#01
    MOV TMOD,#01 ; 16-bitowy timer 0
    SETB TR0 ; startujemy timer 0
    JNB TF0,$
    CLR TF0
    DJNZ R0, diody

    MOV A, P2
    CPL A
    MOV B, #02
    MUL AB
    INC A
    CPL A
    MOV P2, A
    JZ wait
    JMP reset_diody
END