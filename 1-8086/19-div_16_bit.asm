name "div_16_bit"

#make_com#
org 100h

; Q. Divide a 32-bit/4-byte no stored at address [0200H] in RAM, by a 16-bit/2-byte no stored at [0300H]. Store the quotient at [0500H] and remainder at [0550H]

; NOTE: In MOV, When hex is MEMORY ADDRESS, NOT DATA, enclose in square braces!

; VERY IMPORTANT NOTE: Lower address => LSByte, Higher address => MSByte!!!
MOV [0200H], 4444H
MOV [0202H], 0004H
MOV [0300H], 0022H

; DIV src(unsigned 8/16-bit register - divisor) =>
;   Divides a 2-byte WORD by a BYTE, OR a 4-byte DOUBLE WORD by a WORD.
;   1.  8-bit division: 2-byte word AX divided by src => AL <- Quotient; AH <- Remainder
;   2. 16-bit division: 4-byte double word {DX,AX} divided by src => AX <- Quotient; DX <- Remainder
;   Source: Register, Memory Location
; IDIV src(signed 8/16-bit register - divisor) => Same as DIV except that the source is a SIGNED number

MOV DX, [0202H]
MOV AX, [0200H]
MOV BX, [0300H]

DIV BX

MOV [0500H], AX ; Quotient
MOV [0550H], DX ; Remainder

HLT

; See the changes in the memory by going to view -> memory and typing in the [offset] after the colon!

; ALL flags are undefined after DIV

; PLEASE NOTE:  If the divisor is 0 or the result is too large to fit in AL (or AX for 16-bit divisor),
;               then 8086 does a Type 0 interrupt (Divide Error).