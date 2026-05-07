name "find_max_16bit_signed_no"

#make_com#
org 100h
    
; ---INITIALISING ARRAY---    
; Let size of array be at 2000h, and let array start from 1000h
LEA SI, [1000h]
XOR CX, CX

; Creating array {1, 9, 4, 7, 2}
MOV WORD PTR [SI], 01h
ADD SI, 2
INC CX
MOV WORD PTR [SI], 09h
ADD SI, 2
INC CX 
MOV WORD PTR [SI], 04h
ADD SI, 2
INC CX       
MOV WORD PTR [SI], 07h
ADD SI, 2
INC CX       
MOV WORD PTR [SI], 02h
ADD SI, 2
INC CX

MOV [2000h], CX

; ---MAX ELEMENT IN 16-bit SIGNED ARRAY---
; Let max element be stored at 100Ah
LEA SI, [1000h]
MOV CX, [2000h]

MOV AX, [SI] ; Let first element be current max
ADD SI, 2
DEC CX

L: MOV BX, [SI]
CMP AX, BX
JNC NEXT
MOV AX, BX ; Updating max if AL < BL
NEXT: ADD SI, 2
LOOP L

MOV WORD PTR [100Ah], AX

HLT                                                                        