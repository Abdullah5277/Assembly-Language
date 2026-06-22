INCLUDE Irvine32.inc

.data
arr DWORD 10,20,30,40,50,60
arrSize = LENGTHOF arr

msg BYTE "Array After Swapping: ",0

.code
main PROC

    mov ecx, arrSize/2
    mov esi, 0

L1:
    mov eax, arr[esi*4]
    mov ebx, arr[esi*4+4]

    mov arr[esi*4], ebx
    mov arr[esi*4+4], eax

    add esi,2
    loop L1

    mov edx, OFFSET msg
    call WriteString
    call Crlf

    mov ecx, arrSize
    mov esi,0

L2:
    mov eax, arr[esi*4]
    call WriteDec

    mov al,' '
    call WriteChar

    inc esi
    loop L2

    call Crlf

    exit
main ENDP
END main