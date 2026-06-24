include irvine32.inc
.data
msg3 byte"searched num are found ",0
msg4 byte"searched num are not found ",0
msg2 byte "Enter the elemnt that you were seach ",0
msg1 byte "The elements of array are ",0
arr dword 10,20,30,40
.code
main proc

mov edx,offset msg1
call writestring
mov esi,offset arr
mov ecx,lengthof arr



disp:
mov eax,[esi]
call writedec
mov al," "
call writechar
add esi ,type arr
loop disp

mov edx, offset msg2
call writestring
call readint

 mov esi, OFFSET arr
mov ecx, LENGTHOF arr

count:
mov ebx,[esi]
cmp eax,ebx
je found

add esi ,type arr
loop count
mov edx ,offset msg4
call writestring
jmp quit
found :
mov edx,offset msg3
call writestring
quit:
exit
main endp
end main