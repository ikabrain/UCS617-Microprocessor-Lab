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


; ---FINDING MAX ELEMENT IN ARRAY---
; Initialise address & counter again
LXI H, 2000H
LDA 1000H ; A <- [1FFFH]
MOV C, A

; Let current max be in register B
MVI B, 00H

; DO-WHILE loop for finding max (as we'll use JNZ to check if C is 0 => full array traversed)
LOOP:
MOV A, M
CMP B ; Compare current max B with accumulator
; if (A > B) => UPDATE & then SKIP
; if (A < B) i.e. A-B has carry => NO UPDATE & SKIP to next iter
JC SKIP
MOV B, A

SKIP: ; Will run with or without update
INX H
DCR C
JNZ LOOP

; Let final max element in B be stored at location 2500H
MOV A, B
STA 2500H

HLT