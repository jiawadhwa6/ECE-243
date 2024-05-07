.text
.global _start
_start:

    /* r13 should contain the grade of the person with the student number,
    -1 if not found */
    /* r10 has the student number being searched */
    movia r10, 10392584 # r10 is where you put the student number being searched for

    /* Initialize r13 to -1 */
    movi r13, -1

    /* Pointers to the lists of student numbers and grades */
    movia r14, Snumbers
    movia r15, Grades

    /* Pointer to store the result */
    movia r16, result

loop:

    /* Load the current student number and grade */
    ldw r17, (r14)
    ldb r18, (r15)

    /* Check if end of Snumbers list */
    beq r17, r0, finish1

    /* If the student number matches, set the grade in r13 and break out of the loop */
    beq r10, r17, finish

    /* Move to the next student number and grade */
    addi r14, r14, 4
    addi r15, r15, 1

    br loop

finish:

    /* Set r13 to the found grade */
    mov r13, r18
	stb r13, (r16) 

finish1:

    /* Store the result */
    stb r13, (r16)

    /* Infinite loop to prevent program termination */
    iloop: br iloop

.data

/* result should hold the grade of the student number put into r10, or
-1 if the student number isn’t found */

result: .byte 0

/* Snumbers is the list terminated by a zero of the student numbers */
.skip 3
Snumbers: .word 10392584, 423195, 644370, 496059, 296800
.word 265133, 68943, 718293, 315950, 785519
.word 982966, 345018, 220809, 369328, 935042
.word 467872, 887795, 681936, 0

/* Grades is the corresponding list with the grades, in the same order */

Grades: .byte 99, 68, 90, 85, 91, 67, 80
.byte 66, 95, 91, 91, 99, 76, 68
.byte 69, 93, 90, 72

