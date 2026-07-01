TITLE  Addition and Subtraction        (AddSub3.asm)

; Chapter 4 example. Demonstration of ADD, SUB,
; INC, DEC, and NEG instructions, and how
; they affect the CPU status flags.
; Last update: 2/1/02

INCLUDE Irvine32.inc

.data
bigEndian BYTE 12h,34h,56h,78h
littleEndian DWORD ?

.code
main PROC
    mov al, bigEndian+0
    mov ah, bigEndian+1
    mov bl, bigEndian+2
    mov bh, bigEndian+3

    mov BYTE PTR littleEndian+3, al
    mov BYTE PTR littleEndian+2, ah
    mov BYTE PTR littleEndian+1, bl
    mov BYTE PTR littleEndian+0, bh
   
    exit
main ENDP
END main