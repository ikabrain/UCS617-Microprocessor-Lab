name "daa"

#make_com#
org 100h

; DAA - Decimal Adjust after Addition
; - Converts hexadecimal to BCD (packed), where each decimal digit is represented by 4 bits (nibble)
;   eg. 397 or 110001101b or 18Dh can be represented as
;   3 = 0011 | 9 = 1001 | 7 = 0111 => 397 in BCD = 001110010111b or 397h
;   So, 397 or 18D ==> 397h as BCD !!! 
; - Adjusts the packed BCD addition result in AL
;   If lower 4-bits/nibble D3-D0 (one hexadecimal-digit) > 9 OR there is auxiliary carry => add 06h to AL
;   If upper nibble (hex-digit) D7-D4 > 9                    OR there is carry           => add 60h to AL

MOV AH, 32H     ; 32 in Decimal
MOV AL, 28H     ; 28 in Decimal
ADD AL, AH      ; AL = 5A (invalid BCD; should be 60)

DAA             ; AL becomes 60h!!!

HLT
