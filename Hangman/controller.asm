#-----------------------------------------------------------------
# Name:	Toias Lukasewitz (STG-TINF20ITA)
# Kurs:	STG-TINF20ITA
# Fach:	Rechenarchitektur
#-----------------------------------------------------------------

.eqv TRIES 10

j main

# function represents a single game round. It uses the register a0, a1, a2 and a3 to keep track
# of states or for certain functionalities. It consists of user-input, print and checks. It is
# capable of ending the program.
# input:		- a0: check-array
#				- a1: word-array
#				- a2: key entered by user
#				- a3: game states
game.round:
	addi	sp, sp, -20
	sw		ra, 0(sp)
	sw		a0, 4(sp)
	sw		a1, 8(sp)
	sw		a2, 12(sp)
	sw		a3, 16(sp)
	
	#--------------------------------------------------------------
	# get user-input
	#--------------------------------------------------------------
	
	jal	ra, wait_key_pressed	# wait for user-input and get key
	mv		a2, a0
	lw		a0, 4(sp)
	lw		a1, 8(sp)
	
	#--------------------------------------------------------------
	# check if user-input is in word
	#--------------------------------------------------------------
	
	jal	ra, replace				# look if user-input is in word
	
	#--------------------------------------------------------------
	# print game state
	#--------------------------------------------------------------

	jal	ra, print_enter		# print user prompt
	jal	ra, print				# print the current game state
	
	#--------------------------------------------------------------
	# check game-conditions
	#--------------------------------------------------------------
	bnez 	a3, cwc					# branch if state says that a replacement happened
	li 	t0, 1						# if no replacement happened a trie should be subtracted
	sub 	a4, a4, t0				# decrement the try counter
	beqz	a4, print_lose			# check if lose-condition has been reached (a4==0)
	j		skip						# skip further checks for win-conditions
	
	cwc:								# check for win-condition if a replacement happened
	jal	ra, check				# call the needed function
	bnez	a3, print_win			# check if win-condition has been reached (a4!=0)
	
	skip:								
	jal	ra, print_tries		# print number of tries the user has left
	
	# restore registers from stack
	lw		ra, 0(sp)
	lw		a0, 4(sp)
	lw		a1, 8(sp)
	lw		a2, 12(sp)
	lw		a3, 16(sp)
	addi	sp, sp, 20
	ret


# main function
main:
	#a0 = word-array (should never be changed)
	#a1 = check-array (should never be changed)
	#a2 = key
	#a3 = states
	#a4 = number of tries (global)
	
	#--------------------------------------------------------------
	# Start - Preperations and Initializations
	#--------------------------------------------------------------
	li 	a4, TRIES
	
	jal	ra, get_random_word		# get a random word from wordlist
	mv 	a1, a0						# move the returned word to its register

	jal 	ra, after_last_address	# calculate the address for the check-array
	jal 	ra, fill_dst_str			# initialize check-array by 0
	
	jal	ra, print_enter			# prints a user prompt to enter a lower case letter
	jal	ra, print					# prints the game state (initially only in undercores)
	jal	ra, print_tries			# prints the number of tries left (initially max)
	
	#used for debugging (prints the word)
	mv 	t0, a0
	mv 	a0, a1
	li 	a7, 4
	ecall
	mv 	a1, a0
	mv 	a0, t0
	
	#--------------------------------------------------------------
	# Game Loop
	#--------------------------------------------------------------
	loop:									# game round ends the program	
	jal	ra, game.round				# call the game round
	j 		loop							# loop
	
	#--------------------------------------------------------------
	# End of program
	#--------------------------------------------------------------
	end.program:
	li 	a7, 10
	ecall
	
	
#--------------------------------------------------------------
# Inclusions
#--------------------------------------------------------------
.include "interactive.asm"
.include "game.asm"
.include "words.asm"

