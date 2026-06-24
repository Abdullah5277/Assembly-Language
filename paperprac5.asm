INCLUDE Irvine32.inc

.data
array DWORD 10,20,30,40,50,60,70,80

.code
main PROC
    mov esi, OFFSET array
    
   
    mov ecx,lengthof array

L1:
    mov eax, [esi]
    push eax
    inc eax
    add esi,type array

    loop L1
    mov ecx ,lengthof array
l2:
pop eax 
    
  call WriteInt

    mov al, ' '
    call WriteChar
  loop l2
  

    exit
main ENDP
END main