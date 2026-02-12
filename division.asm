; Division is of two types-

; 1. 8-bit
; DIV r/m8 => AX divided by register => Remainder in AH, Quotient in AL

; 2. 16-bit
; DIV r/m16 => DX:AX divided by register => Remainder in DX, Quotient in AX

; Q. Divide a 32-bit no stored at [0200H] offset by 16-bit no stored at [0300H]. Store the quotient at [0500H] and remainder at [0550H]

; MOV [0200H], 12345678H => OVERFLOW ERROR
MOV [0200H], 4444H
MOV [0202H], 0004H
MOV [0300H], 0022H


MOV DX, [0202H]
MOV AX, [0200H]

MOV BX, [0300H]

DIV BX

MOV [0550H], DX ; Remainder
MOV [0500H], AX ; Quotient