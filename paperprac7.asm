TITLE Testing the Irvine32 Library

INCLUDE Irvine32.inc

CR = 0Dh            ; Carriage Return
LF = 0Ah            ; Line Feed

.data

; Messages displayed to the user
rand1   BYTE "Generating 20 random integers between 0 and 999:",CR,LF,0
rand2   BYTE "Generating 20 random integers between 0 and FFFFFFFFh:",CR,LF,0

prompt1 BYTE "Press a key: ",0
prompt2 BYTE "Enter a 32-bit signed integer: ",0
prompt3 BYTE "Enter your name: ",0

msg1    BYTE "The following key was pressed: ",0
regs    BYTE "Displaying the registers:",CR,LF,0

hello   BYTE "Hello, ",0

; Buffer to store user's name
buffer  BYTE 50 DUP(0)

; Variable to store integer entered by user
dwordVal DWORD ?

.code
main PROC

; --------------------------------------------------
; Change screen colors and clear screen
; --------------------------------------------------

    mov eax, black + (white * 16) ; black text, white background
    call SetTextColor

    call Clrscr                   ; clear screen

; --------------------------------------------------
; Initialize random number generator
; --------------------------------------------------

    call Randomize

; --------------------------------------------------
; Display message:
; "Generating 20 random integers between 0 and 999"
; --------------------------------------------------

    mov edx, OFFSET rand1
    call WriteString

; --------------------------------------------------
; Generate 20 random numbers
; --------------------------------------------------

    mov ecx, 20       ; loop counter = 20

    mov dh, 2         ; row position
    mov dl, 0         ; column position

L1:

    call Gotoxy       ; move cursor to (row,column)

    mov eax, 1000     ; upper limit = 1000
    call RandomRange  ; random number: 0-999

    call WriteDec     ; display random number

    mov eax, 500
    call Delay        ; wait 500 milliseconds

    inc dh            ; next row
    add dl, 2         ; move right 2 columns

    loop L1           ; repeat 20 times

; --------------------------------------------------
; Wait for user before continuing
; --------------------------------------------------

    call Crlf
    call WaitMsg
    call Clrscr

; --------------------------------------------------
; Ask user for an integer
; --------------------------------------------------

    mov edx, OFFSET prompt2
    call WriteString

    call ReadInt      ; user enters integer

    mov dwordVal, eax ; save integer

; --------------------------------------------------
; Display integer in decimal
; --------------------------------------------------

    call Crlf
    call WriteInt

; --------------------------------------------------
; Display integer in hexadecimal
; --------------------------------------------------

    call Crlf
    call WriteHex

; --------------------------------------------------
; Display integer in binary
; --------------------------------------------------

    call Crlf
    call WriteBin
    call Crlf

; --------------------------------------------------
; Display CPU registers
; --------------------------------------------------

    call Crlf

    mov edx, OFFSET regs
    call WriteString

    call DumpRegs
    call Crlf

; --------------------------------------------------
; Display memory contents of dwordVal
; --------------------------------------------------

    mov esi, OFFSET dwordVal   ; starting address

    mov ecx, LENGTHOF dwordVal ; number of elements

    mov ebx, TYPE dwordVal     ; size of each element

    call DumpMem

    call Crlf
    call WaitMsg

; --------------------------------------------------
; Ask user for their name
; --------------------------------------------------

    call Clrscr

    mov edx, OFFSET prompt3
    call WriteString

; --------------------------------------------------
; Read user's name into buffer
; --------------------------------------------------

    mov edx, OFFSET buffer

    mov ecx, SIZEOF buffer - 1 ; maximum characters

    call ReadString

; --------------------------------------------------
; Display greeting
; --------------------------------------------------

    mov edx, OFFSET hello
    call WriteString

    mov edx, OFFSET buffer
    call WriteString

    call Crlf

    exit

main ENDP
END main