name "das"

org 100h

; DAS - Decimal Adjustment Subtraction 
; - Adjusts the packed BCD subtraction result in AL
;   If lower 4 bits (one decimal digit) < 0 (AF = 1) or > 9 -> subtract 6
;   If upper digit < 0 (CF = 1) or > 9 -> subtract 60H (96)


MOV AL, 32H     ; 32 in BCD
MOV BL, 28H     ; 28 in BCD
SUB AL, BL      ; AL = A (invalid BCD)

DAS             ; AL becomes 4H

RET