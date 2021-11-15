MOV TMOD,#01000001b  ;8 bit counter + 16 bit timer
wait:
JNB P3.0, start
MOV TL1, #00
JMP wait

start:
MOV P2, #0FFh
MOV TH0,#76
MOV TL0,#01
SETB TR0 ; startujemy timer 0
JNB TF0,$
INC A
CLR TF0
JNB P3.0, start
CLR TR0
MOV R3, A
MOV A, R3
MOV R0, A

diody:
MOV TH0,#76
MOV TL0,#01
SETB TR0 ; start timer
SETB TR1 ; start counter
JNB TF0, $
CLR TF0
DJNZ R0, diody
MOV A, TL1
MOV P2, A
CLR A
JMP wait
END