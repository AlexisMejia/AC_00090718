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
        psw db "axis*"
        frase times 5 db " "

        ; FUNCIONES
        ; Permite leer un carácter de la entrada estándar con echo
        ; Parámetros:   AH: 07h         
        ; Salida:       AL: caracter ASCII leído
        EsperarTecla:
                mov     AH, 01h         
                int     21h
                ret
