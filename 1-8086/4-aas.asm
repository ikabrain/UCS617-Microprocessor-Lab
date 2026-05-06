name "aas"

org 100h
                                 
; AAS - ASCII Adjustment after Subtraction
;  - Adjusts the unpacked ASCII subtraction result in AL
;   e.g. '12' - '5' = '2'
;   In hex, '12' - '5' = (31 32)h - 35h
;   To get correct, we do AND with 0Fh or 0F0Fh
;   Then, it becomes 01 02h - 05h = 01 | FD (1111 1101) {Upper nibble shows that this is POSITIVE!}    
;   We borrow from upper byte (AH) = AH - 1 = 0
;             then lower byte (AL) = AL - 6 = F7
;   Finally, we remove upper nibble with AND 0Fh
;   So, BCD is 00h | 07h, which is 7 !!!
;   To convert back to ASCII (unsigned), we do 0007h OR 30h = 0037h
    
; Thus, AAS algo:-
; if (AL lower nibble > 9 OR AF=1)
; {
;     AL = AL - 6
;     AH = AH - 1
;     CF = 1
; }
; AL = AL AND 0Fh    

MOV AX, '12'    ; AX = 3132h
MOV BL, '7'     ; BL = 35h

AND AX, 0F0Fh   ; AX = 0102h
AND BL, 0Fh     ; BL = 05h

SUB AL, BL      ; 2 - 5 = FDh (-3 in decimal)

AAS             ; AX = 0007h

OR AX, 30h      ; AX = 0007h OR 30h = 0037h

RET