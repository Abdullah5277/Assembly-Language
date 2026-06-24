include irvine32.inc
.data 
msg1 byte"Enter three num ",0

msg2 byte"Largest num are  ",0
var1 dword ?
var2 dword ?
var3 dword ?
arr dword 3 dup(?)

.code 
main proc
mov esi,offset arr
mov ecx,3
l1:
mov edx,offset msg1 
call writestring
call readint
mov var1,eax
call readint
mov var1,eax
call readint
mov var1,eax

mov eax ,var1
cmp eax,var2
jge check3
mov eax,var2


check3:
cmp eax,var3
jge done
mov eax ,var3
done:
mov edx, OFFSET msg2
    call WriteString
    call WriteInt
    call Crlf
loop l1

exit
main endp
end main
