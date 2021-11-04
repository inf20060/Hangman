#-----------------------------------------------------------------
# Name:	Toias Lukasewitz (STG-TINF20ITA)
# Kurs:	STG-TINF20ITA
# Fach:	Rechenarchitektur
#-----------------------------------------------------------------

unittest_after_last_address:
	jal after_last_address
	
	li a7, 10
	ecall
	
.include "controller.asm"