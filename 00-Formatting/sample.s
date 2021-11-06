# Name:		Bao Tran
# Student ID:	123456789
# Assignment:	00 - Formatting
# Description:	Example assembly file formatting

# Pay attention to the formatting styles used
# Use the pound symbol to make comments
# Be clear and brief when commenting your code

	.data				# Use this section to initialize data in memory
str:	.asciiz	"Hello world!\n"	# char* str = "Hello world!\n";

arr0:	.word	0:16			# Array of 16 words, all initialized to 0

arr1:	.half	3:25			# Array of 25 halfwords, all initialized to 3

arr2:	.byte	4,			# Array of 3 bytes, individually initialized
	.byte	5,
	.byte	5

	.text				# This section is where your code goes
	.globl main
main:	add	$s0,	$0,	$0	# Instructions and operands separated by tabs
	xor	$s1,	$s1,	$s1	# Try to keep columns
	li	$t0,	15		# int y = 15;
					# Break code into blocks where separation makes sense
	bgt	$s0,	$t0,	forExt	# For loop
for:	addi	$s0,	$s0,	1
	
	blt	$s0,	$t0,	for	# for(i = 0; i < y; i++)
forExt:	

	li	$v0,	4
	la	$a0,	str
	syscall				# printf("%s", &str);	

	la	$s2,	str		# Pointer declaration syntax
	la	$s3,	arr0		# ptr = &arr0
	
	lw	$t2,	0($s2)		# Pointer dereference syntax
	lw	$t3,	4($s3)		# x = ptr[1]
	sw	$t0,	8($s3)		# ptr[2] = y

	li	$a0,	10
	li	$a1,	3
	jal	funct			# Function call
	move	$s4,	$v0		# ret_val = funct(10, 3);

	li	$v0,	10		# Use this syscall to exit your program
	syscall

funct:	add	$v0,	$a0,	$a1	# funct(int x, int y);
	jr	$ra			# return (x + y);
