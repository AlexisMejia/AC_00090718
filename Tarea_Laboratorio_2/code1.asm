        org 100h
        section .text 

        mov     byte[200h], "A"
        mov     byte[201h], "R"
        mov     byte[202h], "B"
        mov     byte[203h], "M"

; Ejercicio 1
        mov     AX, [200h]
; Ejercicio 2        
        mov     BX, [201h]
        mov     CX, BX
        
; Ejercicio 3
        mov     BP, 200h
        mov     SI, 002h
        mov     DX, [BP+SI]

; Ejercicio 4
        mov     DI, [BP+003h]