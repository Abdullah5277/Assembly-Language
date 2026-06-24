include irvine32.inc
.data 
msg1 word 100h,200h,300h,400h,500h
msg2 dword 5 dup(?)
.code 
main proc
mov esi ,offset msg1
mov edi ,offset msg2
mov ecx,lengthof msg1 
l1:
movzx eax,word ptr[esi]
mov [edi],eax
add esi,type msg1
add edi,type msg2
loop l1
mov edi, OFFSET msg2
 mov ecx, LENGTHOF msg2
l2:
mov eax, [edi]
    call WriteHex

    mov al, ' '
    call WriteChar

    add edi, TYPE msg2

    loop L2

mov edx ,offset msg2
call writestring
mov eax,ebx
call writeint





exit
main endp
end main