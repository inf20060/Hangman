#-----------------------------------------------------------------
# Name:	Toias Lukasewitz (STG-TINF20ITA)
# Kurs:	STG-TINF20ITA
# Fach:	Rechenarchitektur
#-----------------------------------------------------------------


.eqv LENGTH_ARRAY 10

#-----------------------------------------------------------------
# Code-Segment
#-----------------------------------------------------------------
#-----------------------------------------------------------------
# User Prompts and Context/QoL Messages
#-----------------------------------------------------------------
# function gets no input and prints a prompt for the user to enter a lower case letter
print_enter:
	addi sp, sp, -8
	sw ra, 0(sp)
	sw a0, 4(sp)
	
	la a0, enter				# load the text to be displayed
	jal ra, print_msg			# print that message
		
	lw ra, 0(sp)
	lw a0, 4(sp)
	addi sp, sp, 8
	ret
	
	

# function gets the number of tries left as input by the a4 register which is used as the register to keep
# the number of tries the user has left. Before the number is displayed a text for context will be printed. 
# input:		- a4: number of tries the user has left
print_tries:
	addi sp, sp, -8
	sw ra, 0(sp)
	sw a0, 4(sp)
	
	#print text							
	la a0, tries				# load the text bevor displaying the number
	jal ra, print_msg			# print that message
	
	#print tries	
	mv a0, a4					# then load the number of tries
	li a7, 1						# print that number
	ecall							# ecall: printint
	
	#line break
	li a7, 11					# load the printchar ecall
	li a0, 13					# load the value for carriege return
	ecall							# ecall: printchar
	li a0, 10					# load the value for line break
	ecall							# ecall: printchar
	
	#restore a0
	lw ra, 0(sp)
	lw a0, 4(sp)
	addi sp, sp, 8
	ret
	
	
	
#-----------------------------------------------------------------
# Win or Lose Messages
#-----------------------------------------------------------------
# function gets no input and gives the message to display as output. The print function is automatically called
# by this funtion. This particular function is used to print the lose-message when the user has lost the game.
# output:	- a0: message to be displayed in the console 
print_lose:
	la 	a0, lose.msg	# load the lose message
	jal	ra, print_msg	# print the message
	j		end.program

# function gets no input and gives the message to display as output. The print function is automatically called
# by this funtion. This particular function is used to print the win-message when the user has won the game.
# output:	- a0: message to be displayed in the console 
print_win:
	la		a0, win.msg		# load the win message
	jal	ra, print_msg	# print the message
	j 		end.program

# function prints the message given via the register a0 to the console. The message is printed with the RARS ecall
# input:		- a0: message to be displayed
print_msg:	
	li 	a7, 4				# ecall number
	ecall						# ecall: print string
	jalr zero, 0(ra)

	

#-----------------------------------------------------------------
# check-Array initialization
#-----------------------------------------------------------------
# function gets the desination and source address as input. It sets all the following bytes of the dst-address 
# to zero, until the src-word has reached the null-terminator. This function is used to initialize the check-array 
# with zeros. The zero-sate of the check-array is the starting-state. After a letter is discovered, the indizes 
# will be replaced by their ASCII-value. The loop-time is depended on the word-length.
# input:		- a0: destination-address (array)
#				- a1: source-array
fill_dst_str:
	#used to fill the cpy-array with zeros
	#a0 = dst
	#a1 = src
	mv 	t0, a0					#mv dst to seperate register
	mv 	t1, a1					#mv src to seperate register
	li 	t2, 0						#src letter
	li 	t3, 0						#dst letter
	
	copy.s:
	lb		t2, 0(t1)				#get current src letter 
	sb		t3, 0(t0)				#store zero at current position
	beq	t2, zero, copy.e		#check for null-terminator
	
	addi 	t0, t0, 1				#advance
	addi	t1, t1, 1				#advance
	jal	zero, copy.s			#get back to start

	copy.e:
	jalr	zero, 0(ra)



# function gets no input and returns the address after the last word in the wordlist-array.
# The address is needed for the second check-array, which keeps track of the letters that 
# have been dicovered or are still undiscovered.
# output:	a0 - address after last word in wordlist-array
after_last_address:	
	li 	a0, 4						# factor for offset calculation
	li 	t0, LENGTH_ARRAY		# number of words inside the array
	mul 	t0, t0, a0				# calculate the required offset
	
	la 	a0, wordlist			# load start-address of wordlist-array
	add 	a0, a0, t0				# add offset to start-address
	jalr zero, 0(ra)



#-----------------------------------------------------------------
# word determonation
#-----------------------------------------------------------------
# function gets no input and returns a random word from the wordlist-array. The 
# random index is generated via the get_random_number function. 
# output:	a0 - random word chosen from wordlist
get_random_word:	
	addi 	sp, sp, -4
	sw 	ra, (sp)					# save return address

	jal 	get_random_number		# call get_random_number to generate random number
	li 	t0, 4						# factor for offset calculation
	mul 	a0, a0, t0				# calculation of offset
	la 	t0, wordlist			# load start-address of wordlist-array
	add 	t0, t0, a0				# add the offset to the start-address
	lw 	a0, (t0)					# load the word at the random generated index

	lw 	ra, 0(sp)				# load return address
	addi 	sp, sp, 4
	ret
	
	

# function gets no input and return a random Integer from the RARS ecall
# output:	a0 - random number
get_random_number:
	li 	a0, 2						#generator (2, seemed to word nicely)
	li 	a1, LENGTH_ARRAY		#bounds
	li 	a7, 42					#ecall id-number
	ecall								#ecall: random-int
	ret


#-----------------------------------------------------------------
# Data-Segment
#-----------------------------------------------------------------
.data
enter:	.asciz	"Enter a lower-case letter: "
tries:	.asciz	"Number of tries left: "

lose.msg:.asciz	"You lose!"
win.msg:	.asciz	"You win!"

#-----------------------------------------------------------------
# Collection of available words
#-----------------------------------------------------------------
word0:	.asciz  	"dampfschiff"
word1:	.asciz  	"gumba"
word2:	.asciz  	"hallo"
word3:	.asciz  	"computer"
word4:	.asciz 	"motoren"
word5:	.asciz  	"geburtstag"
word6:	.asciz  	"langeweile"
word7:	.asciz  	"probleme"
word8:	.asciz  	"dokumentation"
word9:	.asciz	"assembler"

#-----------------------------------------------------------------
# Array that contains the location address of each word
#-----------------------------------------------------------------
wordlist:
	.word		word0
   .word   	word1
   .word   	word2
   .word   	word3
   .word   	word4
   .word   	word5
   .word   	word6
   .word   	word7
   .word   	word8
   .word   	word9