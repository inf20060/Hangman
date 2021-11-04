#-----------------------------------------------------------------
# Name:	Toias Lukasewitz (STG-TINF20ITA)
# Kurs:	STG-TINF20ITA
# Fach:	Rechenarchitektur
#-----------------------------------------------------------------

.data
word1ut:	.asciz	"hall"
word2ut:	.asciz	"\0all"

.text

unittest_check:	
	# should return 1, since h hasn't been entered
	la a0, word2ut
	la a1, word1ut
	li a2, 0x68
	jal replace
	mv a4, a3
	
	# should return 0, since a has already been entered
	la a0, word2ut
	la a1, word1ut
	li a2, 0x61
	jal replace
	
	li a7, 10
	ecall
	
.include	"controller.asm"