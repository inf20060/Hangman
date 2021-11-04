#-----------------------------------------------------------------
# Name:	Toias Lukasewitz (STG-TINF20ITA)
# Kurs:	STG-TINF20ITA
# Fach:	Rechenarchitektur
#-----------------------------------------------------------------

#--------------------------------------------------------------
# Evaluation of game sates
#--------------------------------------------------------------
# function evaluates if the win-condition has been reached. The condition has been reached
# when every letter is filled out which results in the check-array not containing a single
# zero. The end will be tracked by the null-terminator in word-array
# input:			- a0: check-array
#					- a1: word-array
# outputs:		- a3: game state [a3==1 (win), otherwise 0]
check:
	addi 	sp, sp, -12
	sw 	ra, 0(sp)
	sw		a0, 4(sp)
	sw		a1, 8(sp)
	
	li 	t0, 0					# word-letter
	li		t1, 1					# check-letter
	li		a3, 1					# state
	
	ec.loop.s:
	lb		t0, 0(a1)			# get word-letter
	lb		t1, 0(a0)			# get check-letter
	
	beqz	t0, ec.loop.e		# null-terminator reached
	beqz	t1, ec.no.win		# break when a zero was still found
	
	addi 	a0, a0, 1			# advance iteration
	addi 	a1, a1, 1			# advance iteration
	addi	a3, zero, 1			# set to win-state
	j ec.loop.s					# loop
	
	ec.no.win:
	addi 	a3, zero, 0			# set to zero if a zero was encountered
		
	ec.loop.e:
	lw 	ra, 0(sp)
	lw		a0, 4(sp)
	lw		a1, 8(sp)
	addi 	sp, sp, 12
	ret



#--------------------------------------------------------------
# Replace
#--------------------------------------------------------------
# function is used to replace a byte in check-array if the entered character is contained in the
# word. The current word-byte is used to check the input and if the null-terminator was reached. The
# function will set the state to 1 if a replacement happened for further evaluation.
# input:			- a0: check-array
#					- a1: word-array
#					- a2: key (user-input)
# outputs:		- a3: game state [a3==1 (replacement happened), otherwise 0]
replace:
	addi 	sp, sp, -12
	sw 	ra, 0(sp)
	sw		a0, 4(sp)
	sw		a1, 8(sp)
	
	li 	t0, 0					# word-letter
	li		t1, 1					# check-letter
	li		a3, 0					# state
	
	rp.loop.s:
	lb 	t0, 0(a1)			# get word-letter
	lb		t1, 0(a0)			# get check-letter
	
	beqz	t0, rp.loop.e		# end loop if null-terminator has been reached 
	bne 	t0, a2, rp.neq		# branch if word-letter does not match input-character
	beq	t0, t1, rp.neq		# branch if check-letter already has a value
	
	sb		t0, 0(a0)			# place letter in copy-array
	addi	a3, zero, 1			# set state to 1 since a replacement happened
	
	rp.neq:
	addi 	a0, a0, 1			# advance iteration
	addi 	a1, a1, 1			# advance iteration
	j		rp.loop.s			# loop
		
	rp.loop.e:
	lw 	ra, 0(sp)
	lw		a0, 4(sp)
	lw		a1, 8(sp)
	addi 	sp, sp, 12
	ret
	
	
	
#--------------------------------------------------------------
# Print game state
#--------------------------------------------------------------
# function prints the game-state which translates to how many letters have been discovered. Letter which are discovered
# have their ASCII-Value placed in the check-array. If the letter is undiscovered their value will be 0. In that case a
# underscore will be printed instead of the character.
# input:			- a0: check-array
#					- a1: word-array
print:	
	addi 	sp, sp, -16
	sw 	ra, 0(sp)
	sw		a0, 4(sp)
	sw		a1, 8(sp)
	sw		s0, 12(sp)
	
	li		a7, 11			# set ecall for printChar
	
	pg.loop.s:
	lb 	t1, 0(a1)		# get word-letter
	lb 	t0, 0(a0)		# get check-letter
	
	addi 	a1, a1, 1		# advance iteration
	addi 	a0, a0, 1		# advance iteration
	
	mv 	s0, a0			# save sate of a0 for ecalls
	
	beqz 	t1, pg.loop.e	# branch when null-terminator has been reached
	beqz 	t0, underscore	# branch when check-letter is zero
	
	mv		a0, t1			# symbol: key
	ecall						# ecall: printchar
	j 		space				
	
	underscore:
	li 	a0, 0x5F			# symbol: '_'
	ecall						# ecall: printchar
	j 		space					

		space:
	li 	a0, 0x20			# symbol: ' '
	ecall						# ecall: printchar
	
	mv		a0, s0			# restore a0
	j		pg.loop.s		# loop
	
	pg.loop.e:
	li		a0, 13		# carriage return
	ecall
	li		a0, 10		# line feed
	ecall
	
	lw 	ra, 0(sp)
	lw		a0, 4(sp)
	lw		a1, 8(sp)
	lw		s0, 12(sp)
	addi 	sp, sp, 16
	ret
	
