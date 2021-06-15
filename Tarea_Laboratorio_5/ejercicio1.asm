;Codigo base bioscadena
org 100h
        section .text

        MOV SI, 0
        MOV DI, 0

        MOV DL, 25

        MOV byte[200h], 10
        MOV byte[201h], 12
        MOV byte[202h], 14
        MOV byte[203h], 16

        call modotexto

        itNameOne:
                MOV DH, [200h] 
                call movercursor
                MOV CL, [cadenaName +SI]
                call escribircaracter
                XOR CL, CL
                INC DL
                INC SI
                CMP SI, 7; firstname: "Alexis"
                JB itNameOne
                call spaceBlock
                jmp itNameTwo

        itNameTwo:
                MOV DH, [201h]
                call movercursor 
                MOV CL, [cadenaName+SI] 
                call escribircaracter
                INC DL 
                INC SI
                CMP SI,14; second name: "Rafael"
                JB itNameTwo
                call spaceBlock
                jmp itLastOne

        itLastOne:
                MOV DH, [202h]
                call movercursor 
                MOV CL, [cadenaName+SI]
                call escribircaracter
                INC DL 
                INC SI
                CMP SI,22; first Lastname:"Bolaños"
                JB itLastOne
                call spaceBlock
                jmp itLastSecond
        
        itLastSecond:
                MOV DH, [203h]
                call movercursor 
                MOV CL, [cadenaName+SI]
                call escribircaracter
                INC DL 
                INC SI
                CMP SI,27; second lastname: "Mejía"
                JB itLastSecond
                call spaceBlock
                jmp esperartecla

        esperartecla:
                MOV AH, 00h
                INT 16h        

        spaceBlock:
                MOV DL, 25
                RET

        modotexto: 
                MOV AH, 0h
                MOV AL, 00h; 25 filas, 40 columnas
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
        
        exit:
                int 20h

        section .data
        cadenaName DB 'Alexis Rafael Bolanos Mejia'