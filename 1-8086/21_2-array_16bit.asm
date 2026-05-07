name "making_16bit_array"

#make_com#
org 100h

; Here, remember that all of 16-bit pointer points to ONE BYTE within the memory!!! 
; To automatically write to 2 bytes, use `WORD PTR` & then proceed by 2 memory addresses!
    
; ---INITIALISING ARRAY---    
; Let size of array be at 2000h, and let array start from 1000h
MOV SI, 1000h
XOR CX, CX

; Creating array {-1, 9, 4, -7, -2}
MOV WORD PTR [SI], -0001h ; Lower byte
ADD SI, 2
INC CX

MOV WORD PTR [SI], 0009h
ADD SI, 2
INC CX 

MOV WORD PTR [SI], 0004h
ADD SI, 2
INC CX       

MOV WORD PTR [SI], -0007h
ADD SI, 2
INC CX       

MOV WORD PTR [SI], -0002h
ADD SI, 2
INC CX

MOV [2000h], CX


; ---ACCESSING ARRAY---
MOV SI, 1000h
MOV CX, [2000h]
L: MOV AX, [SI]
ADD SI, 2
LOOP L

HLT                                                                        