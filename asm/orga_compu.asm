name "hi-world"

; this example prints out  "hello world!"
; by writing directly to video memory.
; in vga memory: first byte is ascii character, byte that follows is character attribute.
; if you change the second byte, you can change the color of
; the character even after it is printed.
; character attribute is 8 bit value,
; high 4 bits set background color and low 4 bits set foreground color.

; hex    bin        color
; 
; 0      0000      black
; 1      0001      blue
; 2      0010      green
; 3      0011      cyan
; 4      0100      red
; 5      0101      magenta
; 6      0110      brown
; 7      0111      light gray
; 8      1000      dark gray
; 9      1001      light blue
; a      1010      light green
; b      1011      light cyan
; c      1100      light red
; d      1101      light magenta
; e      1110      yellow
; f      1111      white
 


org 100h

; set video mode    
mov ax, 3     ; text mode 80x25, 16 colors, 8 pages (ah=0, al=3)
int 10h       ; do it!

; cancel blinking and enable all 16 colors:
mov ax, 1003h
mov bx, 0
int 10h


; set segment register:
mov     ax, 0b800h
mov     ds, ax

; print "hello world"
; first byte is ascii code, second byte is color code.

mov [02h], 'O'

mov [04h], 'r'

mov [06h], 'g'

mov [08h], 'a'

mov [0ah], 'n'

mov [0ch], 'i'

mov [0eh], 'z'
 
mov [10h], 'a'

mov [12h], 'c'

mov [14h], 'i'

mov [16h], 'o'

mov [18h], 'n' 

mov [1ah], ' '

mov [1ch], 'd' 

mov [1eh], 'e'

mov [20h], 'l'

mov [22h], ' '
              
mov [24h], 'C' 

mov [26h], 'o'

mov [28h], 'm'

mov [2ah], 'p'

mov [2ch], 'u'

mov [2eh], 't'

mov [30h], 'a'

mov [32h], 'd'

mov [34h], 'o'

mov [36h], 'r'

mov [38h], '.'
            


; color all characters:
mov cx, 28  ; number of characters.
mov di, 03h ; start from byte after 'h'

c:  mov [di], 11101100b   ; light red(1100) on yellow(1110)
    add di, 2 ; skip over next ascii code in vga memory.
    loop c

; wait for any key press:
mov ah, 0
int 16h

ret

