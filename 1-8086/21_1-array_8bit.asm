name "making_8bit_array"

#make_com#
org 100h ; Program is at CS:IP, with IP <- 100h {Actual addr PA(20-bit) = CS(16-bit) * 10h + IP(16-bit)}

; DS (Data Seg)- 16-bit address where Data Segment begins
; BX (Base Reg)- Used as 16-bit offset into DS as START of a data structure
; SI (Src Idx) - Used as 16-bit offset into DS:BX as INDEX INTO data structure
    
; ---INITIALISING ARRAY---    
; Let size of array be at 2000h, and let array start from 1000h
MOV SI, 1000h
XOR CX, CX ; Init count of no. of elem to 0

; Creating array {-1, 9, 4, -7, -2}
MOV [SI], -01h ; Stored as FFh
INC SI
INC CX
MOV [SI],  09h
INC SI
INC CX 
MOV [SI],  04h
INC SI
INC CX       
MOV [SI], -07h
INC SI
INC CX       
MOV [SI], -02h
INC SI
INC CX

MOV [2000h], CX

; ---ACCESSING ARRAY---
MOV SI, 1000h
MOV CX, [2000h]
L: MOV AL, [SI]
INC SI
LOOP L ; LOOP automatically DEC CX & JNZ L i.e. decrements CX & jumps to L if non-zero
; NOTE: LOOP does not modify the flags!

HLT                                                                        