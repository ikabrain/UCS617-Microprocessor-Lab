name "sub_16_bit"

#make_com#
org 100h

MOV AX, 1234h; 3-byte instruction loading 34h -> BL and then 12h -> BH
MOV BX, 5678h; 3-byte instruction loading 78h -> AL and then 56h -> AH

; SUB dst, src => Similar to ADD except that it does subtraction
; SBB dst, src => dst <- dst - src - CF

SUB AX, BX; 16-bit/2-byte instruction for AX <- AX - BX
; Answer is NEGATIVE i.e. 2's complement of BX - AX i.e. 4444H = (FFFF - 4444) + 1
; So, answer is FFFF - 4443 = BBBC (AH = 0BBh, AL = 0BCh!)

HLT

; Flags SUB can change:-
; Bit  0. CF (Carry Flag)           : There's a borrow into MSB (here, AH)
; Bit  2. PF (Parity Flag)          : Checks if LSB (AL) has an even no of one's in binary
; Bit  4. AF (Auxiliary Carry Flag) : Borrow into bit 3 in LSB (AL) out of bit 4 in MSB (AH) - used for BCD
; Bit  6. ZF (Zero Flag)            : 1 if result of op is all zeros.
; Bit  7. SF (Sign Flag)            : Result is negative (MSB = 1)
; Bit 11. OF (Overflow Flag)        : Signed arithmetic overflow/underflow (result doesn't fit in signed range)