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


; ---SORTING ARRAY USING SELECTION SORT---
; PSEUDOCODE(array a[n]):-
; for i = 0 to n-2 (Start with n-1, break if 0)
;     Change start_ptr & min_element_address & ptr to first element
;     Store current minimum value
;     FIND MINIMUM:-
;     for j = i to n-1 (Start with n-i, break if 0; ptr++)
;         Save value at current ptr
;         if [ptr] < [min_element_address], min_element_address = ptr
;     SWAP [start_ptr] <-> [min_element_address]

; Initialise outer loop counter & base address
LXI H, 1000H
MOV C, M
DCR C
DCR C
LXI SP, FFFFH ; Stack used as too many variables!

; v---TODO---v
OUTER: LXI H, 2000H ; HL = Start pointer (Will be used for scanning)
PUSH B ; Save loop counters till before they are needed
PUSH H ; Save start pointer till before it is needed
MOV D, H ; DE = Current minimum address
MOV E, L
MOV B, C ; Inner loop counter = n - i

INNER: MOV A, M ; Loads a[j] element in A
INX H ; a[j+1]

; IF STATEMENT:-
CMP M
; if no carry, A >= [M] i.e. a[j] >= a[j+1] => SWAP and then skip, else ONLY SKIP
JC SKIP

; SWAP A & M
MOV D, M
MOV M, A
DCX H
MOV M, D
INX H
MVI E, 01H

SKIP: DCR B
JNZ INNER

; AFTER INNER LOOP IN OUTER LOOP, check if any swaps. If E = 00H, break:-
MOV A, E
CPI 00H;
JZ STOP

; Else, prep for continuing outer loop now!
DCR C
JNZ OUTER

STOP: HLT
