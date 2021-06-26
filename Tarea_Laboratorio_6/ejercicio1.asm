;codigo base tecladoMS-DOS2
org 100h

        section .text

        ;ingresando la cadena a comparar
        mov BP, cadena
        call leerCadena
        call EscribirCadena
        call EsperarTecla

        section .data

        msg1 db "BIENVENIDO"
        msg2 db "INCORRECTO"
        pswd db "axis*"
        frase times 5 db " "

        ; FUNCIONES
        ; Permite leer un carácter de la entrada estándar con echo
        ; Parámetros:   AH: 07h         
        ; Salida:       AL: caracter ASCII leído
        EsperarTecla:
                mov     AH, 01h         
                int     21h
                ret
        
        ;leerá la longitud de la cadena ingresada
        leerCadena:
                xor     SI, SI
        while:
                call EsperarTecla
                cmp AL, 0x0D
                je exit
                MOV [BP+SI], AL
                
                ;logica de comparacion de la cadena y la clave ya quemada
                MOV CL, [frase+SI] ;la cadena ingresada es alojada caracter por caracter
                MOV BL, [pswd+SI] ;la pswd quemada es alojada caracter por caracter
                INC SI            ;incrementamos el contador para realizar la comparacion entre cadenas
                CMP BL, CL        ;comparación entre cadenas, específicamente caracter x caracter

