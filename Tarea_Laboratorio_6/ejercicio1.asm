;codigo base tecladoMS-DOS2
org 100h

        
        section .text

        ;ingresando la cadena a comparar
        mov BP, frase
        call LeerCadena
        call compararCadena
        call EscribirCadena
        call EsperarTecla

        section .data

        msg1 db "BIENVENIDO", "$"
        msg2 db "INCORRECTO", "$"
        pswd db "axiss", "$"
        frase times 5 db " "

        ; FUNCIONES
        ; Permite leer un carácter de la entrada estándar con echo
        ; Parámetros:   AH: 07h         
        ; Salida:       AL: caracter ASCII leído
        EsperarTecla:
                mov     AH, 01h         
                int     21h
                ret
        

        ; Permite escribir en la salida estándar una cadena de caracteres o string, este
        ; debe tener como terminación el carácter “$”
        ; Parámetros:	AH: 09h 	DX: dirección de la celda de memoria inicial de la cadena
        EscribirCadena:
                mov 	AH, 09h
                int 	21h                             
                ret
        
        ; Leer cadena de texto desde el teclado
        ; Salida:       SI: longitud de la cadena 		BP: direccion de guardado
        LeerCadena:
                xor     SI, SI       ; SI = 0
        condicion:  
                call    EsperarTecla    ; retorna un caracter en AL
                cmp     AL, 0x0D        ; comparar AL con caracter EnterKey
                je      exit            ; si AL == EnterKey, saltar a exit
                mov     [BP+SI], AL   	; guardar caracter en memoria
                inc     SI              ; SI++
                jmp     condicion           ; saltar a while

        ;leerá la longitud de la cadena ingresada
        compararCadena:
                xor     SI, SI
                xor     DI, DI
        while:  
                ;logica de comparacion de la cadena y la clave sean correctas
                mov AL, [BP+SI]                ; Se guarda en AL lo que es te en BP+SI
                cmp AL, [pswd+SI]  
                INC SI            ;incrementamos el contador para realizar la comparacion entre cadenas
                CMP BL, CL        ;comparación entre cadenas, específicamente caracter x caracter
                JE banderaT       ; si el caracter es igual dará paso

