;Codigo base bioscadena
org 100h
        section .text
        xor AX, AX
        xor SI, SI
        xor BX, BX
        xor CX, CX
        xor DX, DX

        MOV SI, 0
        MOV DI, 0

        MOV DH, 3
        MOV DL, 30
        MOV byte[200h], 5
        MOV byte[201h], 7
        MOV byte[202h], 9

        call modotexto

        itNameOne:
                call movercursor 
                MOV CL, [cadenaName+SI] 
                call escribircaracter
                XOR CL, CL
                INC DL 
                INC SI 
                INC DI
                CMP DI, 6; firstname: "Alexis"
                JB itNameOne
                call CmpEspacio
                jmp itNameTwo

        itNameTwo:
                MOV DH, [200h]
                call movercursor 
                MOV CL, [cadenaName+SI] 
                call escribircaracter
                INC DL 
                INC SI 
                INC DI
                CMP DI,6; second name: "Rafael"
                JB itNameTwo
                call CmpEspacio
                jmp itLastOne

        itLastOne:
                MOV DH, [201h]
                call movercursor 
                MOV CL, [cadenaName+SI]
                call escribircaracter
                INC DL 
                INC SI 
                INC DI
                CMP DI,7; first Lastname:"Bolaños"
                JB itLastOne
                call CmpEspacio
                jmp itLastSecond
        
        itLastSecond:
                MOV DH, [202h]
                call movercursor 
                MOV CL, [cadenaName+SI]
                call escribircaracter
                INC DL 
                INC SI 
                INC DI
                CMP DI,5; second lastname: "Mejía"
                JB itLastSecond
                call CmpEspacio
                jmp esperartecla


        modotexto: 
                MOV AH, 0h
                MOV AL, 00h
                INT 10h
                RET

        movercursor:
                MOV AH, 02h
                MOV BH, 0h 
                INT 10h
                RET

        escribircaracter:
                MOV AH, 0Ah 
                MOV AL, CL 
                MOV BH, 0h 
                MOV CX, 1h 
                INT 10h
                RET


        section .data
        cadenaName DB 'Alexis Rafael Bolaños Mejía'