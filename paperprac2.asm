include irvine32.inc
.data
msg1 byte "Original stack are :",0
msg2 byte "Revese stack are :",0
stack1 byte "Abdullah",0
.code
main proc
mov edx ,offset msg1
call writestring
mov edx, offset stack1
call writestring
call crlf
mov edx ,offset msg2 
call writestring

mov esi, offset stack1 
mov eax,0
mov ecx,sizeof stack1-1
l1:
mov al,[esi]
push eax
inc esi
loop l1
mov ecx,sizeof stack1-1
l2:
pop eax
call writechar
loop l2
exit
main endp
end main 
