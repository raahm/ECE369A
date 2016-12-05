.text
.globl main

main:
start:
	add	$s0, $zero, $zero 
	addi	$s1, $zero, 5
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
