name "add_16_bit"

; 8086 has four pairs of 16-bit (1 word size) general-purpose registers available to the programmer - AX, BX, CX, DX
; {`X` always means we are working with register pair}
; AX/Accumulator = combination of 2 8-bit registers AH(A HIGH; 8-bit; stores first 8-bits/1-byte from left i.e. MSB) & AL(A LOW; 8-bit; stores remaining 8-bits/1-byte i.e. LSB)
; BX = BH & BL
; CX = CH & CL
; DX = DH & DL

; IMMEDIATE ADDRESSING - When operand is specified in the assembly instruction itself, instructions are longer but the operands are easily identified.


; (IMMEDIATE) NUMBER SYSTEMS IN emu8086:-
; HEX: 0<no>h {when first digit is A..F} / <no>h
; BIN: <no>b
; OCT: <no>o

; NOTE: XL(LSB) is loaded first, XH(MSB) is loaded LAST, even though we type differently!

; MOV dst, src => Moves a byte/word from the source to the destination specified in the instruction.
;   Source: Register, Memory Location, Immediate Number
;   Destination: Register, Memory Location
;   NOTE: Both, source and destination cannot be memory locations.


; NOTE: In emu8086, immediate hex nos is represented with prefix '0' (if starts with alpha) and suffix 'h'.

#make_com# ; instruct compiler to make COM file.
org 100h ; directive required for a COM program

MOV AX, 2345h; 24-bit/3-byte instruction loading 45h -> AL and then 23h -> AH!!!
MOV BX, 1111h; 24-bit/3-byte instruction loading 11h -> BL and then 11h -> BH

; ADD dst, src => Adds the source to the destination and stores the result back in the destination.
;   Source: Register, Memory Location, Immediate Number
;   Destination: Register
;   Both, source and destination have to be of the same size.
; ADC dst, src => ADD + Carry from CF!

ADD AX, BX; 16-bit/2-byte instruction for AX <- AX + BX 

HLT ; 8-bit/1-byte instruction to halt the CPU, i.e. put it in a low-power state until another interrupt is passed!    

; Now, run this step-by-step (IP will increase by no of bytes in each instruction) & see register contents change by pressing 'F5'     

; NOTE: The MOV instruction cannot be used to set the value of the CS and IP registers, rest all registers can be loaded into!

; FLAGS - 16-bit flag register to denote some special bytes. Can be accessed with 'F5' -> view -> flags. ADD can change:-
; Bit  0. CF (Carry Flag)           : There's a carry out / borrow into MSB (here, AH)
; Bit  2. PF (Parity Flag)          : Checks if LSB (AL) has an even no of one's in binary
; Bit  4. AF (Auxiliary Carry Flag) : Carry out of bit 3 in LSB (AL) into bit 4 in MSB (AH) - used for BCD
; Bit  6. ZF (Zero Flag)            : 1 if result of op is all zeros.
; Bit  7. SF (Sign Flag)            : Result is negative (MSB = 1)
; Bit 11. OF (Overflow Flag)        : Signed arithmetic overflows (result doesn't fit in signed range)