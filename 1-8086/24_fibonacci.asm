name "find_first_10_8bit_fibonacci"

#make_com#
org 100h

; Let no of elements in series be in 1000h    
; & let series be stored from 1001h onwards

; ---STORING COUNT---
MOV [1000h], 0Ah

; ---LOADING COUNT---
LEA SI, [1000h]
MOV CX, [SI]    ; CX <- 0Ah = 10d
INC SI          ; SI <- SI + 1 = 1001h      

; ---FIBONACCI---
XOR AL, AL ; Init current next Fibonacci no as 0

; ---TODO---

MOV AL, [SI] ; Let first element be current max
INC SI
DEC CX

L: MOV BL, [SI]
CMP AL, BL ; If AL < BL, there'll be a carry, else just continue loop if no carry
JNC NEXT
MOV AL, BL ; Updating max if AL < BL
NEXT: INC SI
LOOP L

MOV [100Ah], AL

HLT                                                                        