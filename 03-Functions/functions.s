	.data
msg:	.asciiz	"Hello World!\n"

	.text
main:
	li	$a0,	5
	li	$a1,	2
	li	$a2,	1
	li	$a3,	5
	li	$t0,	3
	
	sw	$t0,	0($sp)
	addi	$sp,	$sp,	-4	

	jal	sum		# function call sum()

	move	$a0,	$v0	# print out return value
	li	$v0,	1
	syscall

	li	$v0,	10	#exit
	syscall



sum:	#returns an int, takes an int argument
	addi	$sp,	$sp,	4
	lw	$t0,	0($sp)		# get fifth arg off the stack	

	add	$a0,	$a0,	$a1	# a += b
	add	$a2,	$a2,	$a3	# c += d
	add	$v0,	$a0,	$a2	# $v0 = a + c
	add	$v0,	$v0,	$t0	# $v0 += e

	jr	$ra
