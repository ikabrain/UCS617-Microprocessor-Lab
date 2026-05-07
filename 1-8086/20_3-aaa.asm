name "aaa"

#make_com#
org 100h

; ASCII decimal digits are offset by 30H or 48
;   '0' = 30h or 48 in ASCII = 0011 0000
;   '1' = 31h or 49 in ASCII = 0011 0001
;   '2' = 32h or 50 in ASCII = 0011 0010
;   '3' = 33h or 51 in ASCII = 0011 0011
;   '4' = 34h or 52 in ASCII = 0011 0100
;   '5' = 35h or 53 in ASCII = 0011 0101
;   '6' = 36h or 54 in ASCII = 0011 0110
;   '7' = 37h or 55 in ASCII = 0011 0111
;   '8' = 38h or 56 in ASCII = 0011 1000
;   '9' = 39h or 57 in ASCII = 0011 1001
                                 
; To convert ASCII to BCD, we subtract 30h  OR  we AND with 0Fh
; To convert BCD to ASCII, we add      30h  OR  we OR  with 30h
; (upper nibble is same; lower nibble is the only that matters!)

; AAA - ASCII Adjust after Addition
; - Adjusts the unpacked/uncoupled ASCII addition result in AL (i.e. the BCD takes ONE WHOLE BYTE i.e. 8-bits, not just nibble!)
;   e.g. '7' + '5' = '12'
;   In hex, '7' + '5' = 37h + 35h = 6Ch, but we want '12' i.e. 3132h
;   Or,     07h + 05h             = 0Ch => Only the LOWER NIBBLE matters!!!
;   We make upper byte (AH) += C // 0Ah  (i.e. +1 for carry) = 1
;           lower byte (AL) += C %  0Ah  (i.e. +6 to loop the hex back from A-F to BCD) = 2
;   Finally, we remove upper nibble with AND 0FH
;   So, unpacked BCD is 01H | 02H, which is 12
;   To convert back to ASCII, we do 0102H OR 3030H = 3132H
    
; Thus, AAA algo:-
; if (AL lower nibble > 9 OR AF=1)
; {
;   AL <- AL + 6
;   AH <- AH + 1
;   CF = AF <- 1
; } else {
;   AL = AL; AH = AH
;   CF = AF <- 0
; }
; In either case, higher nibble of AL = 0 i.e. AL <- AL AND 0Fh         

MOV AH, 00

MOV AL, '7'     ; AL <- 37H
MOV BL, '5'     ; BL <- 35H

ADD AL, BL      ; AL = 6CH (invalid unpacked decimal)

AAA             ; AH = 01H, AL = 02H => AX represents 01 | 02 !!!

OR AX, 3030h    ; Converting back into ASCII

HLT 
