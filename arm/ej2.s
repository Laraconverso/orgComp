@Escribir un programa para ARM que sume 8 elementos de un arreglo almacenado en
@una variable. Los números son enteros.


.equ SWI_Exit, 0x11 @ constante
.data @ variables
datos:  .word 5, 7,-1, 4, 5, 4,-2,-5
cant: 	.word 8
resultado: .word 0

.text @ sección de código

main:
	ldr r0, =cant 			  
	ldr r1, [r0]			 
	ldr r2, =datos
loop:
	cmp r1,#0
	beq salir
	ldr r4, [r2],#4
	add r3,r4
	sub r1,#1
	b loop 

salir: 
	ldr r0, =resultado
	str r3,[r0]
	swi SWI_Exit
	.end