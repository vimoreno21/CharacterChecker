# victoria moreno 
# The program partA.asm finds 
# the number of P, E, G, A, S, O,
# I and D letters in a sentence.
# Then it creates a histogram 
# of the amount.
# $t0 - hold the address of sentence
# $t1 - the character 
# $t2 - P count
# $t3 - E count
# $t4 - G count
# $t5 - A count
# $t6 - S count
# $t7 - O count
# $t8 - I count
# $t9 - D count
# $s1 - counter for loop

.data
P: .asciiz "\nP: "
E: .asciiz "\nE: "
G: .asciiz "\nG: "
A: .asciiz "\nA: "
S: .asciiz "\nS: "
O: .asciiz "\nO: "
I: .asciiz "\nI: "
D: .asciiz "\nD: "
enter: .asciiz "\n"
lbs: .asciiz "#"
sentence: .space 500
intro: .asciiz "Please enter a string.\n"

.text

	# print intro
	li $v0, 4
	la $a0, intro
	syscall 
	
	# get the string from the user
	li $v0, 8
	la $a0, sentence 
	li $a1, 3000
	syscall # load the string 

	la $t0, sentence	# load the string 

	

start: # start of loop going thru the senetence
	lb $t1, 0($t0) 	# get the char 
	beqz $t1, end 	# end if 
	
	checkLet1: # check if its smaller than A 
	blt $t1, 65, continue	# not a letter cus < A
	
	checkLet2: # check if its greater than z 
	bgt $t1, 122, continue # not a letter cus > z
	
	
	itsALet:
	# check for P and p
	bigP: bne $t1, 80, smallP
	j yesP # letter found 
	smallP : bne $t1, 112 bigE 
	yesP: addi $t2, $t2, 1	# letter found 
	j continue
	
	# check for E and e
	bigE: bne $t1, 69 smallE
	j yesE	# letter found 

	smallE: bne $t1, 101 bigG
	yesE: addi $t3, $t3, 1	# letter found 
	j continue
	
	# check for G and g
	bigG: bne $t1, 71 smallG
	j yesG	# letter found 
	smallG: bne $t1, 103 bigA
	yesG: addi $t4, $t4, 1	# letter found 
	j continue
	
	# check for A and a
	bigA: bne $t1, 65 smallA
	j yesA	# letter found 
	smallA: bne $t1, 97 bigS
	yesA: addi $t5, $t5, 1	# letter found 
	j continue
	
	# check for S and s
	bigS: bne $t1, 83 smallS
	j yesS	# letter found 
	smallS: bne $t1, 115 bigO
	yesS: addi $t6, $t6, 1	# letter found 
	j continue
	
	# check for O and o
	bigO: bne $t1, 79 smallO
	j yesO	# letter found 
	smallO: bne $t1, 111 bigI
	yesO: addi $t7, $t7, 1	# letter found 
	j continue
	
	# check for I and i
	bigI: bne $t1, 73 smallI
	j yesI	# letter found 
	smallI: bne $t1, 105 bigD
	yesI: addi $t8, $t8, 1	# letter found 
	j continue
	
	# check for D and d
	bigD: bne $t1, 68 smallD
	j yesD	# letter found 
	smallD: bne $t1, 100 continue
	yesD: addi $t9, $t9, 1	# letter found 

continue: # continue iterating throught the loop
	addi $t0, $t0, 1	# moving char to the next spot
	j start			# go all the way to the top of the loop
	
end: # end of loop going thru the string
	## print the amounts
	
	# print intro
	li $v0, 4
	la $a0, P
	syscall 
	
	# print count
	li $v0, 1
	move $a0, $t2
	syscall
	
	# print intro
	li $v0, 4
	la $a0, E
	syscall 
	
	# print count
	li $v0, 1
	move $a0, $t3
	syscall

	
	# print intro
	li $v0, 4
	la $a0, G
	syscall 
	
	# print count
	li $v0, 1
	move $a0, $t4
	syscall
	
	# print intro
	li $v0, 4
	la $a0, A
	syscall 
	
	# print count
	li $v0, 1
	move $a0, $t5
	syscall
	
	# print intro
	li $v0, 4
	la $a0, S
	syscall 
	
	# print count
	li $v0, 1
	move $a0, $t6
	syscall
	
	# print intro
	li $v0, 4
	la $a0, O
	syscall 
	
	# print count
	li $v0, 1
	move $a0, $t7
	syscall
	
	# print intro
	li $v0, 4
	la $a0, I
	syscall 
	
	# print count
	li $v0, 1
	move $a0, $t8
	syscall
	
	# print intro
	li $v0, 4
	la $a0, D
	syscall 
	
	# print count
	li $v0, 1
	move $a0, $t9
	syscall
	
	# print enter
	li $v0, 4
	la $a0, enter
	syscall 
	
histogram:
	
	# print intro
	li $v0, 4
	la $a0, P
	syscall 
	
	# print #'s loop 
	move $s1, $zero		# set counter to 0
	loop1:			# loop to print #
	bge $s1, $t2, El		# exit loop if greater than the count 
		li $v0, 4	#print #
		la $a0, lbs
		syscall
		addi $s1, $s1, 1	# incrememnt counter
		j loop1			# end of loop 
	
	El:
	# print intro
	li $v0, 4
	la $a0, E
	syscall 
	
	# print #'s loop 
	move $s1, $zero		# set counter to 0
	loop2:			# loop to print #
	bge $s1, $t3, Gl		# exit loop if greater than the count 
		li $v0, 4	#print #
		la $a0, lbs
		syscall
		addi $s1, $s1, 1	# incrememnt counter
		j loop2 		# end of loop 
	
	Gl:
	
	# print intro
	li $v0, 4
	la $a0, G
	syscall 
	
	# print #'s loop 
	move $s1, $zero		# set counter to 0
	loop3:			# loop to print #
	bge $s1, $t4, Al		# exit loop if greater than the count 
		li $v0, 4	#print #
		la $a0, lbs
		syscall
		addi $s1, $s1, 1	# incrememnt counter
		j loop3		 # end of loop 
	
	Al:
	
	# print intro
	li $v0, 4
	la $a0, A
	syscall 
	
	# print #'s loop 
	move $s1, $zero		# set counter to 0
	loop4:			# loop to print #
	bge $s1, $t5, Sl		# exit loop if greater than the count 
		li $v0, 4	#print #
		la $a0, lbs
		syscall
		addi $s1, $s1, 1	# incrememnt counter
		j loop4 		# end of loop 
	
	Sl:

	# print intro
	li $v0, 4
	la $a0, S
	syscall 
	
	# print #'s loop 
	move $s1, $zero		# set counter to 0
	loop5:			# loop to print #
	bge $s1, $t6, Ol		# exit loop if greater than the count 
		li $v0, 4	#print #
		la $a0, lbs
		syscall
		addi $s1, $s1, 1	# incrememnt counter
		j loop5 		# end of loop 
	
	Ol:
	
	# print intro
	li $v0, 4
	la $a0, O
	syscall 
	
	# print #'s loop 
	move $s1, $zero		# set counter to 0
	loop6:			# loop to print #
	bge $s1, $t7, Il		# exit loop if greater than the count 
		li $v0, 4	#print #
		la $a0, lbs
		syscall
		addi $s1, $s1, 1	# incrememnt counter
		j loop6 		# end of loop 
	
	Il:

	# print intro
	li $v0, 4
	la $a0, I
	syscall 
	
	# print #'s loop 
	move $s1, $zero		# set counter to 0
	loop7:			# loop to print #
	bge $s1, $t8, Dl		# exit loop if greater than the count 
		li $v0, 4	#print #
		la $a0, lbs
		syscall
		addi $s1, $s1, 1	# incrememnt counter
		j loop7 		# end of loop 
	
	Dl:
	# print intro
	li $v0, 4
	la $a0, D
	syscall 
	
	# print #'s loop 
	move $s1, $zero		# set counter to 0
	loop8:			# loop to print #
	bge $s1, $t9, last		# exit loop if greater than the count 
		li $v0, 4	#print #
		la $a0, lbs
		syscall
		addi $s1, $s1, 1	# incrememnt counter
		j loop8		# end of loop 
	
	last:

	# terminate program
	li $v0, 10 
	syscall

