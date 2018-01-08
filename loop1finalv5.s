# loop1.s
# Compute the sum of the elements in an array.

# Student:	Your Name		Date

.text
.globl main

# Preconditions:	
#   1st parameter (mem[0]) length of array
#   2nd parameter (mem[4]) array of integers
# Postconditions:	
#   result (mem[0]) sum of array elements

main:
	lui		$s0, 0x1001
	addi	$t0, $s0, 0			# t0 = address of length
	lw	    $t1, 0($t0)			# t1 = length
	addi	$v0, $zero, 0		# v0 = result = 0
	addi	$t0, $t0, 4			# t0 = address of array[0]
	addi	$t1, $t1, -1		# t1 = index of last array element
	nop
	nop
	add	    $t1, $t1, $t1		# multiply length by 4 to get address
	nop
	nop
	add	    $t1, $t1, $t1
	nop
	beq	    $zero, $zero, test	# jump to test at end of loop
	add	    $t1, $t1, $t0		# t1 = address of array[length-1]
	nop

loop:
	lw	    $t2, 0($t1)		# t2 = array[i]
	addi	$t1, $t1, -4		# i--
	nop
	add	    $v0, $v0, $t2		# result += array[i]
test:
	slt	    $t9, $t1, $t0		# if !(i<0) ...
	nop
	nop
	beq	    $t9, $zero, loop	# ... go to loop
	nop
	nop
	nop
	sw	    $v0, 0($t1)		# replace length with result
halt:
	beq	    $zero, $zero, halt

.data
length:	.word	8
array:	.word	9, 8, 7, 6, 5, 4, 3, 2

# $Id: loop1.s,v 1.2 2006/05/25 14:02:07 parks Exp $
# Author: Thomas M. Parks
