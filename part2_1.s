.text # The numbers in memory are executable instructions
.global _start
_start:

/* r13 should contain the grade of the person with the student number,
-1 if not found */
/* r10 has the student number being searched */

movia r10, 1234 # r10 is where you put the student number being searched for
/* Your code goes here */

movi r13, -1

movia r14, Snumbers

movia r15, Grades

ldw r16, (r14)

ldw r17, (r15)

movia r18, result


loop:

/* if they are the same go to finish */
beq r10, r16, finish

/*otherwise go to the next student number and next grade*/

addi r14, r14, 4

addi r15, r15, 4

ldw r16, (r14) 

ldw r17, (r15) 

/*check if end of Snumbers list */

beq r16, r0, finish1

br loop


finish:

mov r13, r17
stw r13, (r18)

finish1: 

stw r13, (r18) 



iloop: br iloop
.data # the numbers in memory that are the data
/* result should hold the grade of the student number put into r10, or
-1 if the student number isn’t found */

result: .word 0
/* Snumbers is the list terminated by a zero of the student numbers */

Snumbers: .word 10392584, 423195, 644370, 496059, 296800
.word 265133, 68943, 718293, 315950, 785519
.word 982966, 345018, 220809, 369328, 935042
.word 467872, 887795, 681936, 0
/* Grades is the corresponding list with the grades, in the same order*/

Grades: .word 99, 68, 90, 85, 91, 67, 80
.word 66, 95, 91, 91, 99, 76, 68
.word 69, 93, 90, 72
