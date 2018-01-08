# loop2.s
# Compute the sum of the elements in an array.
# The loop is unrolled 4 times.

# Student:	Your Name		Date

.text
.globl main

# Preconditions:	
#   1st parameter (mem[0]) length of array, must be a multiple of 4
#   2nd parameter (mem[4]) array of integers
# Postconditions:	
#   result (mem[0]) sum of array elements

main:	nop				# just in case
	addi	$v0, $zero, 0		# v0 = result = 0
	addi	$t0, $zero, 0		# t0 = address of length
	lw	$t1, 0($t0)		# t1 = length
	addi	$t0, $t0, 4		# t0 = address of array[0]
	addi	$t1, $t1, -1		# t1 = index of last array element
	add	$t1, $t1, $t1		# multiply length by 4 to get address
	add	$t1, $t1, $t1
	add	$t1, $t1, $t0		# t1 = address of array[length-1]
	beq	$zero, $zero, test	# jump to test at end of loop

loop:	lw	$t2,   0($t1)		# t2 = array[i]
	add	$v0, $v0, $t2		# result += array[i]
	lw	$t3,  -4($t1)		# t3 = array[i]
	add	$v0, $v0, $t3		# result += array[i-1]
	lw	$t4,  -8($t1)		# t4 = array[i]
	add	$v0, $v0, $t4		# result += array[i-2]
	lw	$t5, -12($t1)		# t5 = array[i]
	add	$v0, $v0, $t5		# result += array[i-3]
	addi	$t1, $t1, -16		# i-=4
test:	slt	$t9, $t1, $t0		# if !(i<0) ...
	beq	$t9, $zero, loop	# ... go to loop

	sw	$v0, 0($t1)		# replace length with result
halt:	beq	$zero, $zero, halt

.data
length:	.word	8
array:	.word	9, 8, 7, 6, 5, 4, 3, 2

# $Id: loop2.s,v 1.2 2006/05/25 14:02:07 parks Exp $
# Author: Thomas M. Parks
