TITLE Data Transfer Examples       (Moves.asm)

; Chapter 4 example. Demonstration of MOV and
; XCHG with direct and direct-offset operands.
; Last update: 2/1/02

INCLUDE Irvine32.inc

.data
arr DWORD 10,20,30,40,50,60
arrSize = LENGTHOF arr

.code
main PROC
    mov ecx, arrSize/2
    mov esi, 0

L1:
    mov eax, arr[esi*4]
    mov ebx, arr[esi*4+4]

    mov arr[esi*4], ebx
    mov arr[esi*4+4], eax

    add esi, 2
    loop L1

    exit
main ENDP
END main