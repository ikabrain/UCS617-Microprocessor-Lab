name "mul_16_bit"

#MAKE_COM#
ORG 100h

MOV AX, 1000h
MOV BX, 5678h

; MUL src(unsigned 8/16-bit register) =>
;   If the source is 8-bit, it is multiplied with AL and the result is stored in AX (AH=higher byte, AL=lower byte)
;   If the source is 16-bit, it is multiplied with AX and the result is stored in DX-AX (DX=higher 2-bytes/1-word, AX=lower 2-bytes/1-word)
;   Source: Register, Memory Location
; IMUL src(signed 8/16-bit register) => Same as MUL except that the source is a SIGNED number

MUL BX; 16-bit/2-byte instruction for AX <- AX - BX

HLT

; Flags MUL can change:-
; Bit  0. CF (Carry Flag)           : There's a carry out of MSB (here, AH)
; Bit  2. PF (Parity Flag)          : Checks if LSB (AL) has an even no of one's in binary
; Bit  4. AF (Auxiliary Carry Flag) : Borrow into bit 3 in LSB (AL) out of bit 4 in MSB (AH) - used for BCD
; Bit  6. ZF (Zero Flag)            : 1 if result of op is all zeros.
; Bit  7. SF (Sign Flag)            : Result is negative (MSB = 1)