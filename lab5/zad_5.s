BUFOR DATA 78h
CYKL EQU 16
LICZNIK EQU 0 

CSEG AT 0h
    AJMP start
CSEG AT 23h
    AJMP przerwanie
CSEG AT 30h

    start:
    SETB EA 
    SETB ES
    MOV SCON, #50h
    MOV TMOD, #20h
    MOV TH1, #0FDh
    SETB TR1
    CLR TI

    petla:
        NOP 
        SJMP petla

    przerwanie:
        SETB PUSH ACC
        PUSH PSW 
        MOV A, SBUF
        CLR RI 
        MOV R0, #BUFOR
        MOV R1, #LICZNIK

    przesuniecie:
        INC R0
        DJZN R1, przesuniecie
        MOV @R0, A

        INC LICZNIK
        MOV A, #LICZNIK
        MOV B, #CYKL
        DIV AB
        MOV LICZNIK, B
        POP PSW
        POP ACC
    RETI
END