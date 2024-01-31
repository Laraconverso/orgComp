@ Este programa halla la suma de dos números mediante una función que los reibe poe la pila
			.data				
        
			numero1:	.word 2	
			numero2:	.word 5
			resultado:	.word 0	
			
			.text	
			.global main
	
main: 		
			ldr r0, =numero1
			ldr r1, [r0]
			
			ldr r0, =numero2
			ldr r2, [r0]
			
			push {r1}
			push {r2}
			
			bl suma
			
			pop {r6}
			ldr r0, =resultado
			str r6,[r0]
			b fin
			
suma:		pop {r4}
			pop {r5}
			add r3, r4, r5
			push {r3}
			bx lr
			
fin:		.end
