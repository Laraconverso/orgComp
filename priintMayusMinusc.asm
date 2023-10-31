
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt
name 'ejemplo'

org 100h

MOV AX, 0B800h
MOV DS, AX

MOV BX, 00h
MOV CL, 41h
MOV CH, 1101_1111b

loop:
    
    MOV [BX], CX
    MOV DX, 12
    ADD BX, 2
    INC CL
    CMP BX, DX
    JLE loop
    
MOV CL, 67h
MOV CH, 1101_1111b
 
JE inver    
     
inver: 
    
    MOV [BX],CX
    MOV DX, 26
    ADD BX, 2
    DEC CL
    CMP BX,DX
    JLE inver
    

ret




