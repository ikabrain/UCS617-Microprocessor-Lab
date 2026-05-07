name "aas"

#make_com#
org 100h
                                 
; AAS - ASCII Adjust after Subtraction
;  - Adjusts the unpacked ASCII subtraction result in AL
;   e.g. '12' - '5' = '2'
;   In hex, '12' - '5' = 3132h - 35h = 31FDh
;   Or, in unpacked BCD, 0102h - 05h = 01FDh = 1111 1101b {Upper nibble shows that this is POSITIVE!}
;   We borrow from upper byte (AH) = AH - 1 = 0
;             then lower byte (AL) = AL - 6 = F7
;   Finally, we remove upper nibble with AND 0Fh
;   So, BCD is 00h | 07h, which is 7 !!!
;   To convert back to ASCII (unsigned), we do 3007h OR 3030h = 0037h
    
; Thus, AAS algo:-
; if (AL lower nibble > 9 OR AF=1)
; {
;   AL <- AL - 6
;   AH <- AH - 1
;   CF = AF <- 1
; } else {
;   AL = AL; AH = AH
;   CF = AF <- 0
; }
; In either case, higher nibble of AL = 0 i.e. AL <- AL AND 0Fh

MOV AX, '12'    ; AX <- 3132h
MOV BL,  '5'    ; BL <-   35h

SUB AL, BL      ; AL <- 2 - 5 = FDh (-3 in decimal)

AAS             ; AX = 3132h to AX = 3007h!

OR AX, 3030h      ; AX <- 3007h OR 30h = 3037h i.e. 07 in unpacked ASCII!!!

HLT
