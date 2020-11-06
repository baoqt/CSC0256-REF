# Name:		Bao Tran
# Student ID:	123456789
# Assignment:	00 - Branching
# Description:	Example branches

	.data

	.text
	.globl main
main:	xor	$s0,	$s0,	$s0	# int x = 0;
	add	$s1,	$s1,	$0	# int y = 0;
	li	$t4,	13		# int z = 13;

	bgt	$s0,	$s1,	else	# if (x <= y) {
	add	$s0,	$0,	$t4	#	x = z;
else:					# } else {
	sub	$s0,	$s0,	$s1	# 	x -= y;
					# }
	li	$t0,	15		# int i = 15;
do:	addi	$t0,	$t0,	-1	# do {
					# 	i--;
	bge	$t0,	0,	do	# } while (i >= 0 );
while:

	xor	$s0,	$s0,	$s0	# i = 0;
	beq	$s0,	30,	forE	# for(i = 0; i != 30; i++) {
for:	addi	$s0,	$s0,	1	# 	i++;
	bne	$s0,	30,	for	# }
forE:
	li	$v0,	10		# Use this syscall to exit your program
	syscall
