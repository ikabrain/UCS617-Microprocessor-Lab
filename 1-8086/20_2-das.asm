name "das"

#make_com#
org 100h

; DAS - Decimal Adjust after Subtraction 
; - Adjusts the packed BCD subtraction result in AL
;   If lower nibble/hex-digit < 0 (AF = 1) or > 9   => subtract 06h from AL
;   If upper nibble/hex-digit < 0 (CF = 1) or > 9   => subtract 60h from AL


MOV AL, 32h     ; 32 in BCD
MOV BL, 28h     ; 28 in BCD
SUB AL, BL      ; AL = A (invalid BCD; should be 4)

DAS             ; AL becomes 4H

HLT
