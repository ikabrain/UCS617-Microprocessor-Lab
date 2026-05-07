name "find_max_8bit_signed_no"

#make_com#
org 100h
    
; ---INITIALISING ARRAY---    
; Let size of array be at 2000h, and let array start from 1000h
LEA SI, [1000h]
XOR CX, CX

; Creating array {1, -9, 4, -7, -2}
MOV [SI], 01h
INC SI
INC CX
MOV [SI], -09h
INC SI
INC CX 
MOV [SI], 04h
INC SI
INC CX       
MOV [SI], -07h
INC SI
INC CX       
MOV [SI], -02h
INC SI
INC CX

MOV [2000h], CX

; ---MAX ELEMENT IN SIGNED ARRAY---
; Let max element be stored at 100Ah
LEA SI, [1000h]
MOV CX, [2000h]

MOV AL, [SI] ; Let first element be current max
INC SI
DEC CX

L: MOV BL, [SI]
CMP AL, BL ; If AL < BL, JL/JNGE will activate (as SF XOR OF becomes 1!!!), else JGE/JNL will activate
JGE NEXT
MOV AL, BL ; Updating max if AL < BL
NEXT: INC SI
LOOP L

MOV [100Ah], AL

HLT                                                                        