INCLUDE Irvine32.inc

.code
main PROC
    mov eax,yellow + (blue * 16)
call SettextColor
    call Randomize

    ; Random column (0-79)
    mov eax,80
    call RandomRange
    mov dl,al

    ; Random row (0-24)
    mov eax,25
    call RandomRange
    mov dh,al

    call Gotoxy

    mov al,'X'
    call WriteChar

    exit
main ENDP
END main