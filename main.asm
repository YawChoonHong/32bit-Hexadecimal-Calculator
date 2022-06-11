TITLE BOOLEAN CALCULATOR
; Section: 03
; Group: 2
; Members: 1. MUHAMMAD SYAIF ALFARIZ BIN ILYAS SUSANTO(A21EC0094)
;		   2. LOH WEI HUAN(A21EC0048)
;		   3. PUAH JUN HONG(A21EC0221)
;		   4.YAW CHOON HONG(A21EC0240)

INCLUDE Irvine32.inc

.data
operationMenu BYTE "--- Boolean Calculator ----------", 0dh, 0ah
			BYTE "1. x AND y", 0dh, 0ah
			BYTE "2. x OR y", 0dh, 0ah
			BYTE "3. NOT x", 0dh, 0ah
			BYTE "4. x XOR y", 0dh, 0ah
			BYTE "5. Exit program", 0dh, 0ah
			BYTE "---------------------------------", 0dh, 0ah,0

userChoice	BYTE "Enter your choice: ",0

input1	BYTE 0dh,0ah
		BYTE "Input the first 32-bit hexadecimal", 0dh, 0ah
		BYTE "operand: ",0

input2  BYTE "Input the second 32-bit hexadecimal", 0dh, 0ah
		BYTE "operand: ",0
result	BYTE "The 32-bit hexadecimal result is: ",0

inputNOT	BYTE 0dh,0ah
			BYTE "Input the 32-bit hexadecimal", 0dh, 0ah
			BYTE "operand: ", 0

promptAND	BYTE "Boolean AND", 0
promptOR	BYTE "Boolean OR", 0
promptNOT	BYTE "Boolean NOT", 0
promptXOR	BYTE "Boolean XOR", 0

promptERROR BYTE "Invalid Input! Please Enter a valid input.", 0

.code
main proc

mainloop:
		mov edx, OFFSET operationMenu ; Print out the Operation Menu List
		call WriteString
		call Crlf
		mov edx, OFFSET userChoice ; Print out the user prompt to ask the user choice
		call WriteString
		call ReadInt	; Read the user input in interger
		xchg ECX,EAX	; Exchange the input value stored in the reg EAX to ECX
		cmp cl, 1	; Compare the input value with the condition
		je loop1	; IF equal to 1, jump to loop1
		jb loop6	; IF less than 1, jump to loop6
		cmp cl,2	; Compare the input value with the condition
		je loop2	; IF equal to 2, jump to loop2
		cmp cl,3    ; Compare the input value with the condition
		je loop3	; IF equal to 3, jump to loop3
		cmp cl,4	; Compare the input value with the condition
		je loop4	; IF equal to 4, jump to loop4
		cmp cl,5	; Compare the input value with the condition
		je loop5	; IF equal to 5, jump to loop5
		ja loop6	; IF more than 3, jump to loop7

	loop1:
		call Crlf
		mov edx, OFFSET promptAND	;Print out the Operation Title (AND)
		call WriteString
		mov edx, OFFSET input1	; Print out the user prompt to ask the user to input first hexadecimal value
		call WriteString
		call ReadHex	; Read the input value in hexadecimal
		xchg EBX, EAX	; Exchange the input value stored in the reg EAX to EBX
		mov edx, OFFSET input2	; Print out the user prompt to ask the user to input second hexadecimal value
		call WriteString
		call ReadHex	; Read the input value in hexadecimal
		AND EAX,EBX		; Execute the AND operation 
		mov EDX,OFFSET result	; Print out the Result of the AND operation in hexadecimal
		call WriteString
		call WriteHex
		call Crlf
		call Crlf
		jmp mainloop	; Jump back to the Operation Menu List

	loop2:
		call Crlf
		mov edx, OFFSET promptOR	;Print out the Operation Title (OR)
		call WriteString
		mov edx, OFFSET input1	; Print out the user prompt to ask the user to input first hexadecimal value
		call WriteString
		call ReadHex	; Read the input value in hexadecimal
		xchg EBX, EAX	; Exchange the input value stored in the reg EAX to EBX
		mov edx, OFFSET input2	; Print out the user prompt to ask the user to input second hexadecimal value
		call WriteString
		call ReadHex	; Read the input value in hexadecimal
		OR EAX,EBX		; Execute the OR operation
		mov EDX,OFFSET result	; Print out the Result of the OR operation in hexadecimal 
		call WriteString
		call WriteHex
		call Crlf
		call Crlf
		jmp mainloop	; Jump back to the Operation Menu List

	loop3:
		call Crlf
		mov edx, OFFSET promptNOT	;Print out the Operation Title (NOT)
		call WriteString
		mov edx, OFFSET inputNOT	;Print out the user prompt to ask the user to input a hexadecimal value
		call WriteString
		call ReadHex	; Read the input value in hexadecimal
		NOT EAX	; Execute the NOT operation
		mov edx, OFFSET result	;Print out the Result of the NOT operation in hexadecimal
		call WriteString
		call WriteHex
		call Crlf
		call Crlf
		jmp mainloop

	loop4:
		call Crlf
		mov edx, OFFSET promptXOR	;Print out the Operation Title (NOT)
		call WriteString
		mov edx, OFFSET input1	;Print out the user prompt to ask the user to input a hexadecimal value
		call WriteString
		call ReadHex	; Read the input value in hexadecimal
		xchg EBX, EAX	; Exchange the input value stored in the reg EAX to EBX
		mov edx, OFFSET input2	; Print out the user prompt to ask the user to input second hexadecimal value
		call WriteString
		call ReadHex	; Read the input value in hexadecimal
		XOR EAX, EBX	; Execute the XOR operation
		mov EDX, OFFSET result	;Print out the Result of the XOR operation in hexadecimal
		call WriteString
		call WriteHex
		call Crlf
		call Crlf
		jmp mainloop	; Jump back to the Operation Menu List

	loop5:
		exit

	loop6:
		mov EDX, OFFSET promptERROR	;Print out the InputError Prompt to the user
		call WriteString
		call Crlf
		call Crlf
		jmp mainloop	; Jump back to the Operation Menu List


main ENDP
END main
