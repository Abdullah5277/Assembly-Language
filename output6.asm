INCLUDE Irvine32.inc

.data
source BYTE "This is the source string",0
target BYTE SIZEOF source DUP(?)

msg BYTE "Reversed String: ",0

.code
main PROC

    mov esi, OFFSET source
    mov ecx,0

L1:
    cmp BYTE PTR [esi+ecx],0
    je L2

    inc ecx
    jmp L1

L2:
    dec ecx
    mov ebx,0

L3:
    mov al, source[ecx]
    mov target[ebx], al

    dec ecx
    inc ebx

    cmp ecx,-1
    jne L3

    mov target[ebx],0

    mov edx, OFFSET msg
    call WriteString
    call Crlf

    mov edx, OFFSET target
    call WriteString
    call Crlf

    exit
main ENDP
END main