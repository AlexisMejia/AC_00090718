;codigo base tecladoMS-DOS2
org 100h
        section .text

        mov DX, msg1
        call EscribirCadena

        ;leer cadena ingresada
        MOV BP, frase
        call LeerCadena

        call EsperarTecla
        int 20h

        section .data
        msg1 db	"", "$"		;Mensaje que pide la clave
        msg2 db "BIENVENIDO", "$"
        msg3 db "INCORRECTO", "$"
        pswd db "axiss", "$"
        frase times 5 db " "

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
                xor     DI, DI
        while:  
                call    EsperarTecla    ; retorna un caracter en AL
                cmp     AL, 0x0D        ; comparar AL con caracter EnterKey
                je      cadena            ; si AL == EnterKey, saltar a exit
                mov     [BP+SI], AL   	; guardar caracter en memoria
                inc     SI              ; SI++
                jmp     while           ; saltar a while

        ;leerá la longitud de la cadena ingresada
        cadena:
                xor     SI, SI
                ;xor     DI, DI
        
        for:
                mov AL, [BP+SI]
                cmp AL, [pswd+SI]
                je banderaC
                jne banderaF

        banderaC:
                cmp SI, 4
                je mensajeC
                inc SI
                jmp for
        
        banderaF:
                mov DX, msg3
                call EscribirCadena
                jmp exit

        mensajeC:
                MOV DX, msg2
                call EscribirCadena
                jmp exit

        ; FUNCIONES
        ; Permite leer un carácter de la entrada estándar con echo
        ; Parámetros:   AH: 07h         
        ; Salida:       AL: caracter ASCII leído
        EsperarTecla:
                mov     AH, 01h         
                int     21h
                ret

        exit:
                mov byte [BP+SI], "$"
                ret
