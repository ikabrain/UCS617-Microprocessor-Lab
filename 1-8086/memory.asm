MOV BL, 10H ; 16
MOV AL, 10H ; 16
MUL BL      ; By default woh AL uthayenga, result stored in AX  
; So result is 0100H (16-bits) -> AL(8-bits), AH(8-bits)

MOV [0500H], AX ; When HEX is MEMORY ADDRESS, NOT DATA, enclose in square braces!

; Memory is stored as SEGMENTS, there are 4 segments:-
; 1. Code Segment (CS)
; 2. Data Segment (DS)
; 3. Stack segment(SS)
; 4. Extra Segment(ES)

; So, data goes to DS segment and within DS, it goes at DS:0500H offset, containing the byte (or 2-digit hex) required!


; Lower  address => LSB
; Higher address => MSB
; First 8-bit XL gets filled, then in next offset 8-bit XH gets filled!