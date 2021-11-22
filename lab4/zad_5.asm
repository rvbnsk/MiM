licznik EQU 0h

CSEG AT 0h
    AJMP start

CSEG AT 0Bh
    AJMP przerwanie

CSEG AT 30h
    start:
    MOV A, #0FFh
    SETB EA
    SETB ET0
    MOV P2, A
    petla:
    MOV TH0, #76
    MOV TL0, #01
    MOV TMOD, #01
    SETB TR0
    JNB TF0, $
    SJMP petla

    przerwanie:
    MOV R2, licznik
    CJNE R2, #20, koniec
    DEC A
    MOV P2, A
    MOV licznik, #0h
    koniec:
    INC licznik
    RETI
END
