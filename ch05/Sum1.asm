INCLUDE Irvine32.inc

.data
prompt1 BYTE "Enter first integer: ",0
prompt2 BYTE "Enter second integer: ",0
msgSum BYTE "The sum is: ",0
pauseMsg BYTE "Press any key to continue...",0

.code
main PROC
    mov ecx, 3

L_outer:
    push ecx
    call Clrscr

    mov dh, 12
    mov dl, 30
    call Gotoxy
    mov edx, OFFSET prompt1
    call WriteString
    call ReadInt
    mov ebx, eax

    mov dh, 13
    mov dl, 30
    call Gotoxy
    mov edx, OFFSET prompt2
    call WriteString
    call ReadInt
    add eax, ebx

    mov dh, 14
    mov dl, 30
    call Gotoxy
    mov edx, OFFSET msgSum
    call WriteString
    call WriteInt
    call Crlf
    call Crlf

    mov edx, OFFSET pauseMsg
    call WriteString
    call ReadChar

    pop ecx
    loop L_outer

    exit
main ENDP
END main