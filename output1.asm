INCLUDE Irvine32.inc

.data
bigEndian BYTE 12h,34h,56h,78h
littleEndian DWORD ?

msg1 BYTE "Little Endian Value: ",0

.code
main PROC

    mov al, bigEndian+0
    mov ah, bigEndian+1
    mov bl, bigEndian+2
    mov bh, bigEndian+3

    mov BYTE PTR littleEndian+3, al
    mov BYTE PTR littleEndian+2, ah
    mov BYTE PTR littleEndian+1, bl
    mov BYTE PTR littleEndian+0, bh

    mov edx, OFFSET msg1
    call WriteString

    mov eax, littleEndian
    call WriteHex
    call Crlf

    exit
main ENDP
END main