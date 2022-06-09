INCLUDE irvine32.inc

.data

operationMenu BYTE "--- Boolean Calculator ----------", 0dh, 0ah
			BYTE "1. x AND y", 0dh, 0ah
			BYTE "2. x OR y", 0dh, 0ah
			BYTE "3. NOT x", 0dh, 0ah
			BYTE "4. x XOR y", 0dh, 0ah
			BYTE "5. Exit program", 0dh, 0ah
			BYTE "---------------------------------", 0dh, 0ah, 0 

userChoice	BYTE "Enter your choice: ",0


input1	BYTE 0dh,0ah
		BYTE "Input the first 32-bit hexadecimal", 0dh, 0ah
		BYTE "operand: ",0

input2  BYTE "Input the second 32-bit hexadecimal", 0dh, 0ah
		BYTE "operand: ",0
result BYTE "The 32-bit hexadecimal result is: ",0

valInput1 DWORD ?
valInput2 DWORD ?
valResult DWORD ?

promptAND	BYTE "Boolean AND", 0
promptOR	BYTE "Boolean OR", 0
promptNOT	BYTE "Boolean NOT", 0
promptXOR	BYTE "Boolean XOR", 0

ENDLINE BYTE 0dh,0ah,0

.code
main proc

mainloop:
		mov edx, OFFSET operationMenu
		call WriteString
		call Crlf
		mov edx, OFFSET userChoice
		call WriteString
		call ReadInt
		xchg EAX,ECX
		cmp cl, 1
		je loop1
		cmp cl,2
		je loop2
		cmp cl,3
		je loop3
		cmp cl,4
		je loop4
		cmp cl,5
		je loop5

	loop1:
		call Crlf
		mov edx, OFFSET promptAND
		call WriteString
		mov edx, OFFSET input1
		call WriteString
		call ReadHex
		xchg EAX, EBX
		mov edx, OFFSET input2
		call WriteString
		call ReadHex
		AND EAX,EBX
		mov EDX,OFFSET result
		call WriteString
		call WriteHex
		call Crlf
		call Crlf
		jmp mainloop

	loop2:
		call Crlf
		mov edx, OFFSET promptOR
		call WriteString
		mov edx, OFFSET input1
		call WriteString
		call ReadHex
		xchg EAX, EBX
		mov edx, OFFSET input2
		call WriteString
		call ReadHex
		OR EAX,EBX
		mov EDX,OFFSET result
		call WriteString
		call WriteHex
		call Crlf
		call Crlf
		jmp mainloop

	loop3:
		call Crlf
		mov edx, OFFSET promptNOT
		call WriteString
		mov edx, OFFSET input1
		call WriteString
		call ReadHex
		xchg EAX, EBX
		NOT EAX
		mov edx, OFFSET result
		call WriteString
		call WriteHex
		call Crlf
		call Crlf
		jmp mainloop

	loop4:
		call Crlf
		mov edx, OFFSET promptXOR
		call WriteString
		mov edx, OFFSET input1
		call WriteString
		call ReadHex
		xchg EAX, EBX
		mov edx, OFFSET input2
		call WriteString
		call ReadHex
		XOR EAX, EBX
		mov EDX, OFFSET result
		call WriteString
		call WriteHex
		call Crlf
		call Crlf
		jmp mainloop

	loop5:
		exit
		main ENDP
		END main
