name "count_pos_neg_8bit_array"

#make_com#
org 100h

; Negative nos always have MSB = 1 i.e. if we shift them to left by 1 and their MSB goes to carry, CF = 1!!!
    
; ---INITIALISING ARRAY---    
; Let size of array be at 2000h, and let array start from 1000h
LEA SI, [1000h] ; Loads EFFECTIVE ADDRESS, better than MOV when loading addresses after address computations!
XOR CX, CX

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

; ---COUNTING +/- IN ARRAY---
; Let positive num count be at BL -> 100Ah, negative at DL -> 100Bh
LEA SI, [1000h]
MOV CX, [2000h]
XOR BL, BL
XOR DL, DL
L: MOV AL, [SI]
SHL AL, 01h ; Shifts bits of AL left by 1 & stores MSB in CF
JNC L2 ; If there's no carry, add as positive and loop
L1: INC DL ; If there's carry, add as negative and skip positive and THEN loop
JMP L3
L2: INC BL
L3: INC SI
LOOP L

MOV [100Ah], BL
MOV [100Bh], DL

HLT                                                                        