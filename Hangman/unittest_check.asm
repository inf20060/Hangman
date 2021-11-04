#-----------------------------------------------------------------
# Name:	Toias Lukasewitz (STG-TINF20ITA)
# Kurs:	STG-TINF20ITA
# Fach:	Rechenarchitektur
#-----------------------------------------------------------------

.data
word1ut:	.asciz	"hall"
word2ut:	.asciz	"pol\0"

.text

unittest_check:
	# should return 1, since words are the same
	la a0, word1ut
	la a1, word1ut
	jal check
	mv a4, a3
	
	# should return 0, since word2ut contains a zero
	la a0, word2ut
	la a1, word1ut
	jal check
	
	li a7, 10
	ecall
	
.include	"controller.asm"