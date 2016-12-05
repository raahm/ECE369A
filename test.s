.text
.globl main

main:
	add	$s0, $zero, $zero
	add	$s1, $zero, $zero
	addi	$t0, $zero, 1
	addi	$t1, $zero, 2
	addi	$t3, $zero, 3
	addi	$t4, $zero, 4
	addi	$t5, $zero, 5
	addi	$t6, $zero, 6
start:
	addi	$s1, $s1, 1
	addi	$s2, $zero, 6
	addi	$s3, $zero, 6
	addi	$s4, $zero, 7
	addi	$s5, $zero, 8	
	addi	$s6, $zero, 9
	addi	$s7, $zero, 9
	beq	$s0, $zero, start
	addi	$s0, $zero, 10
	addi	$s1, $zero, 10
	addi	$s2, $zero, 10
	addi	$s3, $zero, 10
