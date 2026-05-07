name "aam"

#make_com#
org 100h

; AAM - ASCII Adjust after Multiplication
;  - Adjusts the unpacked ASCII multiplication result in AX
;   e.g. '7' * '5' = '35'
;   In hex, '7' * '5' = 37h * 35h = 0B63h   
;   FIRST, ME MUST MASK THE UPPER NIBBLES OF BOTH NOS & CONVERT FROM ASCII -> BCD
;   Now,in unpacked BCD,07h * 05h = 0023h
;   So now, upper byte AH = AL // 0Ah (10 in decimal)     = 03h
;       and lower byte AL = AL %  0Ah (Remainder of prev) = 05h
;   So, BCD is 03h | 05h, which is 35 !!!
;   To convert back to ASCII, we do 0305h OR 3030h = 3335h

; Thus, AAM algo:-
; AH <- AL / 10
; AL <- AL % 10

MOV AL, '7'     ; AL <- 37h
MOV BL, '5'     ; BL <- 35h

AND AL, 0Fh     ; AL <- 07h
AND BL, 0Fh     ; BL <- 05h

MUL BL          ; AX <- 7 * 5 = 23h

AAM             ; AX = 0023h to AH <- 23h/0Ah = 03h; AL <- Remainder = 05h

OR AX, 3030h    ; AX <- 0305h OR 3030h = 3335h i.e. 35 in unpacked ASCII!!!

HLT
