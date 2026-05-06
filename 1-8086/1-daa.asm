name "daa"

org 100h

; DAA - Decimal Adjustment Addition
; - Converts hexadecimal to BCD (packed), where each decimal digit is represented by 4 bits (nibble)
;   eg. 397 or 110001101b or 18D can be represented as
;   3 = 0011 | 9 = 1001 | 7 = 0111 => 397 in BCD = 001110010111b or 397H
;   So, 397 or 18D ==> 397H as BCD !!! 
; - Adjusts the packed BCD addition result in AL
;   If lower 4 bits (one decimal digit) > 9 -> add 6
;   If upper digit > 9 or Carry -> add 60H (96)


MOV AH, 32H     ; 32 in BCD
MOV AL, 28H     ; 28 in BCD
ADD AL, AH      ; AL = 5A (invalid BCD)

DAA             ; AL becomes 60H

RET


