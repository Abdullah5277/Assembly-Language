INCLUDE Irvine32.inc

.data
char BYTE 'X'
delay DWORD 100

.code
main PROC
    call Randomize
    call GetMaxXY ; DH = rows, DL = cols

    movzx ebx, dl ; ebx = max col
    movzx esi, dh ; esi = max row

    mov ecx, 100
L1:
    ; random column 0 .. maxCol-1
    mov eax, ebx
    call RandomRange
    mov dl, al

    ; random row 0 .. maxRow-1
    mov eax, esi
    call RandomRange
    mov dh, al

    call Gotoxy
    mov al, char
    call WriteChar

    mov eax, delay
    call Delay

    loop L1

    call Crlf
    exit
main ENDP
END main