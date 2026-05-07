name "aad"

#make_com#
org 100h

; AAD - ASCII Adjust before Division
;  - Adjusts the unpacked ASCII dividend before division in AX
;   e.g. '35' / '5' = '7'
;   Masking upper nibbles, 0305h / 05h
;   AAD converts 0305h to 35's hexadecimal form = 23h in AL by REVERSE PROCESS OF AAM!!!
;   & AH is cleared to 00h
;   Then we can divide 23h by 05h to get 07h quotient
;   To convert result back to ASCII, we do AL OR 30h = 37h i.e. '7'

; Thus, AAD algo:-
; AL <- AH * 0Ah + AL
; AH <- 00h

MOV AX, '35'    ; AX <- 3335h
MOV BL,  '5'    ; BL <-   35h

AND AX, 0F0Fh   ; AX <- 0305h
AND BL,   0Fh   ; BL <-   05h

AAD             ; AX = 0305h to AX <- 0023h

DIV BL          ; AL <- 23h / 05h = 07h, AH <- 23h % 05h = 00h

OR AL, 30h      ; AL <- 07h OR 30h = 37h i.e. '7' in ASCII!!!

HLT
