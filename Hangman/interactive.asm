#-----------------------------------------------------------------
# Name:	Toias Lukasewitz (STG-TINF20ITA)
# Kurs:	STG-TINF20ITA
# Fach:	Rechenarchitektur
#-----------------------------------------------------------------

.eqv KEY_PRESSED	0xffff0000		# set when user-input happened
.eqv KEY_VALUE		0xffff0004		# the key that was pressed

# function is used to retrieve input from user. It will loop until the user enters
# a valid input which are letters from a to z. 
# output:		- a0: key pressed
wait_key_pressed:	
	li 	t0, KEY_PRESSED			# load address
	li 	t1, KEY_VALUE				# load address
	
	wkp.loop.s:
	lw 	t2, (t0)						# load KEY_PRESSED to check user-input
	beqz	t2, wkp.loop.s				# check if key was pressed, otherwise loop
	
	lw		a0, (t1)						#get key pressed


	li t3, 97 							# letter: 'a'
	blt a0, t3, wkp.loop.s			# branch if entered key is not between a and z
	
	li t3, 122 							# letter: 'z'
	bgt a0, t3, wkp.loop.s			# branch if entered key is not between a and z
	
	jalr	zero, 0(ra)


