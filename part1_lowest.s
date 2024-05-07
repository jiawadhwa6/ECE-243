.global _start
_start: movia r8, result # the address of the result
	ldw r9,4(r8)	# the number of numbers is in r9
	
	movia r10, numbers  # the address of the numbers is in r10 (i in a loop)
	
	
/* keep largest number so far in r11 */

	ldw	r11,(r10)
	
/* loop to search for biggest number */

loop: subi r9, r9, 1
       ble r9, r0, finished # if r9<0 then branhch to finish
	   
	   addi r10,r10,4   # add 4 to pointer to the numbers to point to next one
	   
	   ldw  r12, (r10)  # load the next number into r12
	   
	   ble  r11, r12, loop  # if the current biggest is still biggest, go to loop
	   
	   mov r11,r12   # otherwise new number is smaller, put it into r11
	   br  loop
	   


finished: stw r11,(r8)    # store the answer into result
.equ LEDs, 0xFF200000
movia r25, LEDs
stwio r11, (r25)

iloop: br iloop

result: .word 0
n:	.word 15
numbers: .word 4,5,3,6,7
	     .word 1, 8, 2,9,10
		 .word 20,14,16,24,13