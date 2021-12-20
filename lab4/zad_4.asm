CSEG AT 0
    
AJMP reset
 
CSEG AT 30h
    
    reset:
    MOV SCON, #50h
    MOV TMOD, #20h
    MOV TH1, #0FDh
    SETB TR1
    CLR TI
    
    przyciski:
    JNB P3.7,kodowanie
    JNB P3.6,dekodowanie
    AJMP przyciski
    
    kodowanie:
    SETB P2.6
    CLR P2.7
    
    JNB RI, $
    MOV A,SBUF
    CLR RI
    
    CLR P2.0
    
    INC A
    MOV SBUF,A
    JNB TI,$
    CLR TI
    
    SETB P2.0
    
    AJMP przyciski
    
    dekodowanie:
    SETB P2.7
    CLR P2.6
    
    JNB RI, $
    MOV A,SBUF
    CLR RI
    
    CLR P2.0
    
    DEC A
    MOV SBUF,A
    JNB TI,$
    CLR TI
    
    SETB P2.0
    
    AJMP przyciski
    END