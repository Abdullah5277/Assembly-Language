INCLUDE Irvine32.inc

.data
count DWORD 50

.code
;-----------------------------------------------------
BetterRandomRange PROC
; Returns random int in [EBX, EAX-1] in EAX
; Requires: EBX = lower bound M, EAX = upper bound N
;-----------------------------------------------------
    push ebx
    push edx

    sub eax, ebx ; range = N - M
    call RandomRange ; 0.. range-1
    add eax, ebx ; + M

    pop edx
    pop ebx
    ret
BetterRandomRange ENDP

main PROC
    call Randomize

    mov ecx, count
L1:
    mov ebx, -300 ; M = lower bound
    mov eax, 100 ; N = upper bound
    call BetterRandomRange

    call WriteInt
    call Crlf
    loop L1

    exit
main ENDP
END main