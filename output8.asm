INCLUDE Irvine32.inc

.data
arr DWORD 10,20,30,40
arrSize = LENGTHOF arr

msg BYTE "Array After Rotation: ",0

.code
main PROC

    mov eax, arr[arrSize*4-4]

    mov ecx, arrSize-1
    mov esi, arrSize-1

L1:
    mov ebx, arr[esi*4-4]
    mov arr[esi*4], ebx

    dec esi
    loop L1

    mov arr[0], eax

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