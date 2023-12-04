@ En este programa realizamos la suma de dos números.
@ Los operandos pasarán de variables a registros.
@ El resultado pasará de un registro a una variable.
@ Veremos los registros, la memoria y, mediante WatchView, las variables.
@ 1. cargar el programa
@ 2. view memory

@Siempre que vea corchetes, es memoria

.equ SWI_Exit, 0x11 @ constante
.data @ variables
numero1: .word 2
numero2: .word 5
resultado: .word 0

.text @ sección de código

.global main @ avisa al linker que main es global

main:
	ldr r0, =numero1 		@ r0 = dirección de numero1 para direccionamiento directo 
	ldr r1, [r0]			@ r1 = 2 carga r1 con modo de direccionamiento directo
	ldr r0, =numero2 		@ r0 = dirección de numero2 para direccionamiento directo
	ldr r2, [r0] 			@ r2 = 5 carga r2 con modo de direccionamiento directo
	add r3, r1, r2 			@ suma r1 + r2 y lo guarda en r3
	ldr r0, =resultado		@ r0 = dirección de resultado
	str r3, [r0]			@ resultado = r3 guarda r3 en la variable resultado 
					@||STORE excepcion se asigna de reg a memoria 
	swi SWI_Exit			@ salir del programa
	.end