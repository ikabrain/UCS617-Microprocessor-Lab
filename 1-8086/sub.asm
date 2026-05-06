MOV AX, 0x5678
MOV BX, 0x1234
SUB BX, AX

; Answer is NEGATIVE i.e. 2's complement of 4444H => (FFFF - 4444) + 1
; So, answer is FFFF - 4443 => BBBC (BH = 0BBH, BL = 0BCH)