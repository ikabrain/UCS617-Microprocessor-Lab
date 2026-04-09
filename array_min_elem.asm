; ---INITIALISING ARRAY---
; Let array starting address be 2000H
LXI H, 2000H
MVI C, 00H ; Count no. of elements in array

; Creating array {2, 5, 3, 1, 4}
MVI M, 02H
INX H
INR C

MVI M, 05H
INX H
INR C

MVI M, 03H
INX H
INR C

MVI M, 01H
INX H
INR C

MVI M, 04H
INX H
INR C

; Let array size be stored at 1000H
MOV A, C
STA 1000H


; ---FINDING MIN ELEMENT IN ARRAY---
; Initialise address & counter again
LXI H, 2000H
LDA 1000H ; A <- [1FFFH]
MOV C, A

; Let current min be in register B
MVI B, 0FFH

; DO-WHILE loop for finding min (as we'll use JNZ to check if C is 0 => full array traversed)
LOOP:
MOV A, M
CMP B ; Compare current min B with accumulator
; if (A > B) i.e no carry => NO UPDATE & SKIP to next iter
; if (A < B) => UPDATE & then SKIP
JNC SKIP
MOV B, A

SKIP: ; Will run with or without update
INX H
DCR C
JNZ LOOP

; Let final max element in B be stored at location 2500H
MOV A, B
STA 2500H

HLT