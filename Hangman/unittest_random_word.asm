#-----------------------------------------------------------------
# Name:	Toias Lukasewitz (STG-TINF20ITA)
# Kurs:	STG-TINF20ITA
# Fach:	Rechenarchitektur
#-----------------------------------------------------------------

unittest:
	jal get_random_word
	
	li a7, 10
	ecall
	
.include "controller.asm"
