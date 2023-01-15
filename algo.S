.data
N:
	.word 4
M:
	.word 3
matrix:
	.word 8, 105, 1, 10
	.word 77, 3, 55, 98
	.word 34, 10, 120, 45
start_print:
	.asciiz "Index of max element: ("
end_print:
    	.asciiz ")\n"

.text

main:
	la a0, matrix
	lw a1, M
	lw a2, N
	call find_max_index
	call print
	call exit

find_max_index:
	lw t2, 0(a0) # max value
    	addi t0, x0, 1 # collumn index
	addi t1, x0, 0 # row index
	addi sp, sp, -8
	sw x0, 0(sp) # max_x 
	sw x0, 4(sp) # max_y
	addi a0, a0, 4 # increment matrix pointer

loop:
	lw t3, 0(a0) # load value from matrix
	bge t2, t3, next_value # if new value is smaller than previous then just increment pointer
	addi t2, t3, 0 # else put new value in "max" register
	sw t0, 0(sp) 
	sw t1, 4(sp)

next_value:
	addi a0, a0, 4
	addi t0, t0, 1 
	blt t0, a2, loop
	addi t0, x0, 0
	addi t1, t1, 1
	blt t1, a1, loop
	ret

print:
	addi a0, x0, 4 # 11 - print char
	la a1, start_print
	ecall
    
	addi a0, x0, 1 # 1 - print int
	lw a1, 0(sp)
	ecall
    
    addi a0, x0, 11
	addi a1, x0, 44
	ecall

	addi a0, x0, 1
	lw a1, 4(sp)
	addi sp, sp, 8
	ecall
    
    addi a0, x0, 4
	la a1, end_print
	ecall
    
	ret

exit:
	addi a0, x0, 10
	ecall
