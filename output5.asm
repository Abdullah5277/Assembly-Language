INCLUDE Irvine32.inc

.data
fib DWORD 7 DUP(?)

msg BYTE "Fibonacci Series: ",0

.code
main PROC

    mov fib[0],1
    mov fib[4],1

    mov ecx,5
    mov esi,2

L1:
    mov eax, fib[esi*4-4]
    add eax, fib[esi*4-8]

    mov fib[esi*4], eax

    inc esi
    loop L1

    mov edx, OFFSET msg
    call WriteString
    call Crlf

    mov ecx,7
    mov esi,0

L2:
    mov eax, fib[esi*4]
    call WriteDec

    mov al,' '
    call WriteChar

    inc esi
    loop L2

    call Crlf

    exit
main ENDP
END main