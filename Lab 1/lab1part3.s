/* Program to add the numbers 1 to 30 */
    .global _start
    _start:
        movi r8,1          /* r8 <- 1  lower limit*/
        movi r9,30         /* r9 <- 3o upper limit */
        movi r12,0         /* r12 <- 0 sum initailised to 0 */
	loop:
		add r12,r12,r8     /*add current valur to sum*/
		addi r8,r8,1       /*increment current value*/
		ble r8,r9,loop     /*value at r8>=r9*/
		
     done: br done          /* infinite loop */

	
	