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


; ---SORTING ARRAY USING BUBBLE SORT---
; PSEUDOCODE(array a[n]):-
; for i = n-1 to i = 1 (break if i = 0)
;     Change ptr to first element
;     for j = 0 to i-1 (Start with i, break if = 0)
;         Save value at current ptr
;         ptr <- ptr + 1
;         if Stored ptr > New ptr = ptr + 1, swap the two (BUBBLES out max elements), else skip
;     if no swaps in inner loop (store as a flag) , break outer loop as array sorted

; Initialise outer loop counter & base address
LXI H, 1000H
MOV C, M
DCR C

OUTER: MVI E, 00H ; Swap flag
LXI H, 2000H ; Back to first element
MOV B, C ; Inner loop counter = i

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