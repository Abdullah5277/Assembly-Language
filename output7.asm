INCLUDE Irvine32.inc

.data
arr DWORD 1,2,3,4,5,6
arrSize = LENGTHOF arr

msg BYTE "Reversed Array: ",0

.code
main PROC

    mov esi,0
    mov edi,arrSize-1
    mov ecx,arrSize/2

L1:
    mov eax, arr[esi*4]
    mov ebx, arr[edi*4]

    mov arr[esi*4], ebx
    mov arr[edi*4], eax

    inc esi
    dec edi
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