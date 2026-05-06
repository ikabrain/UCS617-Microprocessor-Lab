name "aam"

org 100h
                                 
; AAM - ASCII Adjustment after Multiplication
;  - Adjusts the unpacked ASCII multiplication result in AX
;   e.g. '7' * '5' = '35'
;   In hex, '7' * '5' = 37h * 35h
;   To get correct, we do AND with 0Fh
;   Then, it becomes 07h * 05h = 23h (35 in decimal)
;   So now, upper byte AH = AL // 10 = 03h
;       and lower byte AL = AL %  10 = 05h
;   So, BCD is 03h | 05h, which is 35 !!!
;   To convert back to ASCII, we do 0305h OR 3030h = 3335h
    
; AH = AL / 10
; AL = AL % 10

MOV AL, '7'     ; AL = 37h
MOV BL, '5'     ; BL = 35h

AND AL, 0Fh     ; AL = 07h
AND BL, 0Fh     ; BL = 05h

MUL AL, BL      ; AL = 07 * 05 = 23h

AAS             ; AX = 0007h

OR AX, 30h      ; AX = 0007h OR 30h = 0037h

RET