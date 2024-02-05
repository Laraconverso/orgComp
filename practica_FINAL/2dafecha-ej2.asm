;Maquina elemental 
;Detectar si el contenido de la direccion EE tiene el bit 2 y el bit 3 en 0. 
;En caso afirmativo dejar en EE el bit 0 en uno y el bit 7 en cero. 
;En caso contrario dejar en EE el bit 1 en uno y el bit 6 en cero, sin modificar los bits restantes. 
El punto de carga es la direccion 20. 
        ? ?
- - - - - - - - 
7 6 5 4 3 2 1 0

mascara = 00001100 hago and y deberia quedar 0000 0000 
mascara en hexa es 0C

mascara en caso afirmativo AND 0111 1111 -> en hexa es 7F
mascara en caso nevativo  AND 1011 1111 -> en hexa es BF

20 11EE -> cargo en el registro 1 lo que se encuentra en [EE]
22 2000 -> cargo R0 con '0000 0000'
24 220C ->cargo r2 con 0000 1100 (la mascara)
26 8312 -> and entre r1 y r2 y el resultado lo guardo en r3 
28 B330 -> comparo r0 con r3 si son iguales  el bit 3 y 2 esta en 0 salta a [30]
2A 24BF -> cargo la mascara caso negativco
2C 8414 -> and de r1 y r4
2E B034 -> salto incondicional a 
30 247F -> cargo la mascara caso afirmtivo 
32 8414 -> and de r1 y r4 
34 34EE -> cargo a ee lo del registro 4   
36 C000 -> fin programa