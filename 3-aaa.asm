name "aaa"

org 100h

; ASCII decimal digits are offset by 30H or 48
;   '0' = 30H or 48 in ASCII = 0011 0000
;   '1' = 31H or 49 in ASCII = 0011 0001
;   '2' = 32H or 50 in ASCII = 0011 0010
;   '3' = 33H or 51 in ASCII = 0011 0011
;   '4' = 34H or 52 in ASCII = 0011 0100
;   '5' = 35H or 53 in ASCII = 0011 0101
;   '6' = 36H or 54 in ASCII = 0011 0110
;   '7' = 37H or 55 in ASCII = 0011 0111
;   '8' = 38H or 56 in ASCII = 0011 1000
;   '9' = 39H or 57 in ASCII = 0011 1001
                                 
; To convert ASCII to BCD, we subtract 30H  OR  we AND with 0FH
; To convert BCD to ASCII, we add      30H  OR  we OR  with 30H
; (upper nibble is same; lower nibble is the only that matters!)

; AAA - ASCII Adjustment after Addition
; - Adjusts the unpacked/uncoupled ASCII addition result in AL (i.e. the BCD takes ONE WHOLE BYTE i.e. 8-bits, not just nibble i.e. 4-bits)
;   e.g. '7' + '5' = '12'
;   In hex, '7' + '5' = 37H + 35H
;   To get correct, we do AND with 0FH
;   Then, it becomes 7H + 5H = CH
;   We make upper byte (AH) += C // 10  (i.e. +1 for carry) = 1
;           lower byte (AL) += C % 10   (i.e. +6 to loop the hex back from A-F to BCD!!!) = 2
;   Finally, we remove upper nibble with AND 0FH
;   So, BCD is 01H | 02H, which is 12 !!!
;   To convert back to ASCII, we do 0102H OR 3030H = 3132H
    
; Thus, AAA algo:-
; if (AL lower nibble > 9 OR AF=1)
; {
;     AL = AL + 6
;     AH = AH + 1
;     CF = 1
; }
; AL = AL AND 0Fh    

MOV AH, 00

MOV AL, '7' ; AL = 37H
MOV BL, '5' ; BL = 35H

AND AL, 0FH ; AL = 07H
AND BL, 0FH ; BL = 05H

ADD AL, BL  ; AL = 0CH (12 in decimal)

AAA         ; AH = 01H, AL = 02H !!! => AX represents 01 | 02 !!!

OR AX, 3030H;

RET