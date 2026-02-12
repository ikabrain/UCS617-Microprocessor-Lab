; Put DS:0200 = 12H
; and DS:0201 = 34H
MOV [0200H], 12H
MOV [0201H], 34H

; Then, move into AX
MOV AX, [0200H]         
; Now, AX is 3412H (AX will load BOTH as it will fill all its 16-bits!)

; Doing same with B
; Put DS:0202 = 11H
; and DS:0203 = 22H
MOV [0202H], 11H
MOV [0203H], 22H

MOV BX, [0202H]
; BX is 2211H

MUL BX ; MSB stored in DX (16-bits), LSB stored in AX (16-bits) (output is 32-bit!!!)
                                              
; Finally, let's move the result to 0204H-0205H (LSB as lower address) and 0206H-0207H (MSB as higher address)!
MOV [0204H], AX
MOV [0206H], DX

; Answer is 06EDD932H !!!