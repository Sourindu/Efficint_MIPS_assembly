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

main:	
	nop							# just in case
	addi	$v0, $zero, 0		# v0 = result = 0
	addi	$t0, $zero, 0		# t0 = address of length
	addi	$t6, $zero, 0		# t6 = 0
	addi	$t7, $zero, 0		# t7 = 0
	addi	$t8, $zero, 0		# t8 = 0
	nop
	nop
	lw		$t1, 0($t0)		# t1 = length
	addi	$t0, $t0, 4		# t0 = address of array[0]
	nop
	addi	$t1, $t1, -1		# t1 = index of last array element
	nop
	nop
	add		$t1, $t1, $t1		# multiply length by 4 to get address
	nop
	nop
	add		$t1, $t1, $t1
	nop
	nop
	add		$t1, $t1, $t0		# t1 = address of array[length-1]
	nop
	nop
	beq		$zero, $zero, test	# jump to test at end of loop
	nop
	nop
	nop
loop:
	lw		$t2,   0($t1)		# t2 = array[i]32 16
	lw		$t3,  -4($t1)		# t3 = array[i]28 12
	lw		$t4,  -8($t1)		# t4 = array[i]24 8
	lw		$t5, -12($t1)		# t5 = array[i]20 4
	add		$t6, $t2, $t3		# t6 = array[i-1]+array[i-2]
	addi	$t1, $t1, -16		# i-=4 16 0
	add		$t7, $t4, $t5		# t7 = array[i-3]+array[i-4]
test:
	nop
	slt		$t9, $t1, $t0		# if !(i<0) ...
	nop
	add		$t8, $t6, $t7		# t8 = array[i-1]+array[i-2] + array[i-3]+array[i-4]
	beq		$t9, $zero, loop	# ... go to loop
	nop
	add 	$v0, $v0, $t8       # result += array[i-1]+array[i-2] + array[i-3]+array[i-4]
	nop
	nop
	sw		$v0, 0($t1)		# replace length with result
halt:		beq	$zero, $zero, halt

.data
length:	.word	8
array:	.word	9, 8, 7, 6, 5, 4, 3, 2

# $Id: loop2.s,v 1.2 2006/05/25 14:02:07 parks Exp $
# Author: Thomas M. Parks
