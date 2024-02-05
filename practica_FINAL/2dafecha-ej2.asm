;Maquina elemental 
;Detectar si el contenido de la direccion EE tiene el bit 2 y el bit 3 en 0. 
;En caso afirmativo dejar en EE el bit 0 en uno y el bit 7 en cero. 
;En caso contrario dejar en EE el bit 1 en uno y el bit 6 en cero, sin modificar los bits restantes. 
El punto de carga es la direccion 20. 

- - - - - - - - 
7 6 5 4 3 2 1 0

20 11EE -> cargo en el registro 1 lo que se encuentra en [EE]
22 2000 -> cargo R0 con '0000 0000'
24 
26
28
2A
2C
2E
3
