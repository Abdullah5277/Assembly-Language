include irvine32.inc
.data
msg1 byte "PAkistan Zindabad "
.code
main proc
mov ecx,10
l1:
mov edx,offset msg1
call WriteString    
  call Crlf
loop l1
exit
main ENDP
END main


