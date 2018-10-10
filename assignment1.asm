TITLE Program 1     (assignment1.asm)

; Author: Glenn Kiefer
; Last Modified: 10/7/2018
; OSU email address: kieferg@oregonstate.edu
; Course number/section: CS271_400
; Project Number: 1             Due Date: 10/7/2018
; Description: This MASM program displays the name of the author and program title on the output screen,
; displays instructions for the user, prompts the user to enter two numbers, calculates the sum, 
; difference, product, (integer) quotient and remainder of the numbers, and displays a terminating message.

INCLUDE Irvine32.inc

.data

	titleBanner		BYTE	"  Glenn Kiefer - Program 1",0
	introduction1	BYTE	"   Enter 2 numbers, and I'll show you the sum, difference, ",0
	introduction2	BYTE	"    product, quotient, and remainder.",0
	prompt1			BYTE	"   Please enter your first integer:  ",0
	prompt2			BYTE	"   Please enter your second integer: ",0
	firstNum		DWORD	?
	secondNum		DWORD	?															
	sum				DWORD	?
	difference		DWORD	?
	product			DWORD	?
	quotient		DWORD	?
	remainder		DWORD	?
	buffer			BYTE	"   ",0
	equals			BYTE	" = ",0
	resultSum		BYTE	" + ",0
	resultDiff		BYTE	" -	",0
	resultProd		BYTE	" x	",0
	resultQuot		BYTE	" / ",0
	resultRemain	BYTE	" remainder ",0
	goodbye			Byte	"  Looks like we've reached the end of our exercise. Have a good one!",0

.code
main PROC

;introduction: Informs the user who authored this project and what this program is designed to do
	mov		edx, OFFSET titlebanner
	call	WriteString
	call	CrLf
	mov		edx, OFFSET introduction1
	call	WriteString
	call	CrLf
	mov		edx, OFFSET introduction2
	call	WriteString
	call	CrLf

;get the data: Prompts user for input. Asks for two integers
	call	CrLf
	mov		edx, OFFSET prompt1
	call	WriteString
	call	ReadInt
	mov		firstNum, eax
	call	CrLf
	mov		edx, OFFSET prompt2
	call	WriteString
	call	ReadInt
	mov		secondNum, eax

;calculate the required values: Finds the sum, difference, product, quotient, and remainder of two user numbers
	;sum
	add		eax, firstNum
	mov		sum, eax

	;difference
	mov		eax, firstNum 
	sub		eax, secondNum
	mov		difference, eax

	;product
	mov		eax, firstNum
	mov		ebx, secondNum
	mul		ebx
	mov		product, eax

	;quotient and remainder
	mov		eax, firstNum
	div		secondNum
	mov		quotient, eax
	mov		remainder, edx

;display the results
	; Sum results
	call	CrLf
	mov		edx, OFFSET buffer
	call	WriteString
	mov		eax, firstNum
	call	WriteDec
	mov		edx, OFFSET resultSum
	call	WriteString
	mov		eax, secondNum
	call	WriteDec
	mov		edx, OFFSET equals
	call	WriteString
	mov		eax, sum
	call	WriteDec
	call	CrLf

	; Difference results
	mov		edx, OFFSET buffer
	call	WriteString
	mov		eax, firstNum
	call	WriteDec
	mov		edx, OFFSET resultDiff
	call	WriteString
	mov		eax, secondNum
	call	WriteDec
	mov		edx, OFFSET equals
	call	WriteString
	mov		eax, difference
	call	WriteDec
	call	CrLf

	; Product results
	mov		edx, OFFSET buffer
	call	WriteString
	mov		eax, firstNum
	call	WriteDec
	mov		edx, OFFSET resultProd
	call	WriteString
	mov		eax, secondNum
	call	WriteDec
	mov		edx, OFFSET equals
	call	WriteString
	mov		eax, product
	call	WriteDec
	call	CrLf

	; Quotient and remainder results
	mov		edx, OFFSET buffer
	call	WriteString
	mov		eax, firstNum
	call	WriteDec
	mov		edx, OFFSET resultQuot
	call	WriteString
	mov		eax, secondNum
	call	WriteDec
	mov		edx, OFFSET equals
	call	WriteString
	mov		eax, quotient
	call	WriteDec
	mov		edx, OFFSET resultRemain
	call	WriteString
	mov		eax, remainder
	call	WriteDec
	call	CrLf

;say goodbye
	call	CrLf
	mov		edx, OFFSET goodbye
	call	WriteString
	call	CrLf

	exit	; exit to operating system
main ENDP

END main
