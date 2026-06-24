INCLUDE Irvine32.inc
.data 
arr dword 129
msg1 byte "The asciii num are "
.code
main PROC

    mov ecx,lengthof arr     ; 128 characters
    mov al,1         ; Start from ASCII 1

L1:
    movzx eax,al
    call WriteDec    ; Print ASCII number

    mov al,' '
    call WriteChar   ; Space
    add ecx,type arr
    mov al,cl
    neg al
    add al,type arr       ; Generate ASCII value

    call WriteChar   ; Print character
    call Crlf

    mov al,129
    sub al,cl

    loop L1

    exit
main ENDP
END main