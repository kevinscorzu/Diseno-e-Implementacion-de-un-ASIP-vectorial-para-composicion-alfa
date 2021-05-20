INICIO:


start:
	MOVI R10, 0x3AD68	;
	LDR R10, R10		; // Obtiene de inicio
	CMPI R10, 0x0		;
	JEQ start		;
	MOVI R10, 0x3AD79	;
	LDR R10, R10		; // Obtiene la orientacion H
	MOVI R2, 0x1D4C0	; // Direccion Rojos
	MOVI R3, 0x27100	; // Direccion Verdes
	MOVI R4, 0x30D40	; // Direccion Blue
select_orientation:
	MOVI R11, 0x0		; // Contador de las columnas
	MOVI R12, 0x0		; // Contador de las filas
	MOVI R1, 0x1		; // 1 de la suma
	CMPI R10, 0x1		;
	JEQ horizontal_for_x	; // Salta a inicializar el degradado horizontal
	MOVI R10, 0x3AD7A	;
	LDR R10, R10		; // Obtiene la orientacion V
	CMPI R10, 0x1		;
	JEQ vertical_for_x	; // Salta a inicializar el degradado vertical
	MOVI R10, 0x3AD7B	;
	LDR R10, R10		; // Obtiene la orientacion D
	CMPI R10, 0x1		;
	JEQ angular_for_x	; // Salta a inicializar el degradado angular
	MOVI R10, 0x3AD7C	;
	LDR R10, R10		; // Obtiene la orientacion P
	CMPI R10, 0x1		;
	JEQ proposed_for_x 	; // Salta a inicilizar el degradado propuesto
vertical_for_y:
	ADD R12, R12, R1	; // Aumenta el contador de las filas
	MOVI R11, 0x0		; // Vuelve 0 el contador de columnas
	CMPI R12, 0xC8		;
	JEQ degraded 		; // Salta a hacer la degradacion
vertical_for_x:
	CMPI R11, 0xC8		;
	JEQ vertical_for_y	; // Si recorrio todas las columnas vuelve a el for y
	STR R2, R12		; // Almacena el indice de las filas en las memorias
	STR R3, R12		;
	STR R4, R12		;
	ADD R2, R2, R1		; // Dirigue a la siguiente direccion de la memoria
	ADD R3, R3, R1		;
	ADD R4, R4, R1		;
	ADD R11, R11, R1	; // Aumenta el contador de las columnas
	JMP vertical_for_x	;
horizontal_for_y:
	ADD R12, R12, R1	; // Aumenta el contador de las filas
	MOVI R11, 0x0		; // Vuelve 0 el contador de columnas
	CMPI R12, 0xC8		;
	JEQ degraded 		; // Salta a hacer la degradacion
horizontal_for_x:
	CMPI R11, 0xC8		;
	JEQ horizontal_for_y	; // Si recorrio todas las columnas vuelve a el for y
	STR R2, R11		; // Almacena el indice de las columnas en las memorias
	STR R3, R11		;
	STR R4, R11		;
	ADD R2, R2, R1		; // Dirigue a la siguiente direccion de la memoria
	ADD R3, R3, R1		;
	ADD R4, R4, R1		;
	ADD R11, R11, R1	; // Aumenta el contador de las columnas
	JMP horizontal_for_x	;
angular_for_y:
	ADD R12, R12, R1	; // Aumenta el contador de las filas
	MOVI R11, 0x0		; // Vuelve 0 el contador de columnas
	CMPI R12, 0xC8		;
	JEQ degraded 		; // Salta a hacer la degradacion
angular_for_x:
	CMPI R11, 0xC8		;
	JEQ angular_for_y	; // Si recorrio todas las columnas vuelve a el for y
	ADD R5, R11, R12	;
	STR R2, R5		; // Almacena la suma del indice de las columnas y las filas en las memorias
	STR R3, R5		;
	STR R4, R5		;
	ADD R2, R2, R1		; // Dirigue a la siguiente direccion de la memoria
	ADD R3, R3, R1		;
	ADD R4, R4, R1		;
	ADD R11, R11, R1	; // Aumenta el contador de las columnas
	JMP angular_for_x	;
proposed_for_y:
	ADD R12, R12, R1	; // Aumenta el contador de las filas
	MOVI R11, 0x0		; // Vuelve 0 el contador de columnas
	CMPI R12, 0xC8		;
	JEQ degraded 		; // Salta a hacer la degradacion
proposed_for_x:
	CMPI R11, 0xC8		;
	JEQ proposed_for_y	; // Si recorrio todas las columnas vuelve a el for y
	ADD R5, R11, R12	; // x + y
	SUB R6, R11, R12	; // x - y
	STR R2, R6		; // Almacena el indice de las columnas en las memorias
	STR R3, R6		;
	STR R4, R5		;
	ADD R2, R2, R1		; // Dirigue a la siguiente direccion de la memoria
	ADD R3, R3, R1		;
	ADD R4, R4, R1		;
	ADD R11, R11, R1	; // Aumenta el contador de las columnas
	JMP proposed_for_x	;
degraded:
	MOVI R2, 0x1D4C0	; // Direccion Rojos
	MOVI R3, 0x27100	; // Direccion Verdes
	MOVI R4, 0x30D40	; // Direccion Blue
	MOVI R14, 0x0		; // Intensidad
	MOVI R11, 0x3AD69	;
	LDR R11, R11		; // Intensidad Rojo
	CMPI R11, 0x1		;
	JEQ green		;
	MOVI R14, 0x19		; // Contador 25
	MOVI R11, 0x3AD6A	;
	LDR R11, R11		; // Intensidad Rojo
	CMPI R11, 0x1		;
	JEQ green		;
	MOVI R14, 0x4B		; // Contador 75
	MOVI R11, 0x3AD6B	;
	LDR R11, R11		; // Intensidad Rojo
	CMPI R11, 0x1		;
	JEQ green		;
	MOVI R14, 0x64		; // Contador 100
	MOVI R11, 0x3AD6C	;
	LDR R11, R11		; // Intensidad Rojo
green:
	MOVR R11, R14		; // Valor de la intensidad de R
	MOVI R14, 0x0		; // Contador
	MOVI R12, 0x3AD6D	;
	LDR R12, R12		; // Intensidad Verde
	CMPI R12, 0x1		;
	JEQ blue		;
	MOVI R14, 0x19		; // Contador
	MOVI R12, 0x3AD6E	;
	LDR R12, R12		; // Intensidad Verde
	CMPI R12, 0x1		;
	JEQ blue		;
	MOVI R14, 0x4B		; // Contador
	MOVI R12, 0x3AD6F	;
	LDR R12, R12		; // Intensidad Verde
	CMPI R12, 0x1		;
	JEQ blue		;
	MOVI R14, 0x64		; // Contador
	MOVI R12, 0x3AD70	;
	LDR R12, R12		; // Intensidad Verde
blue:
	MOVR R12, R14		; // Valor de intensidad de G
	MOVI R14, 0x0		; // Contador
	MOVI R13, 0x3AD71	;
	LDR R13, R13		; // Intensidad Azul
	CMPI R13, 0x1		;
	JEQ degraded_aux	;
	MOVI R14, 0x19		; // contador
	MOVI R13, 0x3AD72	;
	LDR R13, R13		; // Intensidad Azul
	CMPI R13, 0x1		;
	JEQ degraded_aux	;
	MOVI R14, 0x4B		; // Contador
	MOVI R13, 0x3AD73	;
	LDR R13, R13		; // Intensidad Azul
	CMPI R13, 0x1		;
	JEQ degraded_aux	;
	MOVI R14, 0x64		; // Contador
	MOVI R13, 0x3AD74	;
	LDR R13, R13		; // Intensidad Azul
degraded_aux:
	MOVR R13, R14		; // Valor de la intesidad del Blue
	MOVI R14, 0x0		; // Contador
	MOVI R1, 0x4		; // 4
	MOVI R5, 0xFF		; // 255
	MOVI R6, 0x64		; // 100
	MOVI R7, 0xC8		; // 200
	MUL R11, R11, R5	; // R * 255
	DIV R11, R11, R6	; // R = R * 255 / 100
	MUL R12, R12, R5	; // G * 255
	DIV R12, R12, R6	; // G = G * 255 / 100
	MUL R13, R13, R5	; // B * 255
	DIV R13, R13, R6	; // B = B * 255 / 100
gradient_for:
	CMPI R14, 0x9C40	;
	JEQ alpha_composition	; // contador == 40000 salte a la composicion alfa
	LDRV V1, R2		; // vector rojo
	LDRV V2, R3		; // vector verde
	LDRV V3, R4		; // vector azul
	MULVE V1, V1, R11	; // vector rojo * Rsize
	MULVE V2, V2, R12	; // vector verde * Gsize
	MULVE V3, V3, R13	; // vector azul * Bsize
	DIVVE V1, V1, R7	; // vector rojo * Rsize / 200
	DIVVE V2, V2, R7	; // vector verde * Rsize / 200
	DIVVE V3, V3, R7	; // vector azul * Rsize / 200
	STRV R2, V1		; // guarda los resultados en memoria RAM
	STRV R3, V2		;
	STRV R4, V3		;
	ADD R2, R2, R1		; // suma 4 a la direccion
	ADD R3, R3, R1		;
	ADD R4, R4, R1		;
	ADD R14, R14, R1	; // suma 4 al contador
	JMP gradient_for	;
alpha_composition:
	MOVI R15, 0x3AD7D 	; // Inicio del fin
	MOVI R14, 0x1		; // 1
	STR R15, R14		; // Escribe en 1 en el inicio del fin
	MOVI R14, 0x0		; // Contador
	MOVI R5, 0x3AD75	; // Transparencia
	LDR R5, R5		;
	CMPI R5, 0x1		;
	JEQ alpha_aux		;
	MOVI R14, 0x19		; // Contador
	MOVI R5, 0x3AD76	; // Transparencia
	LDR R5, R5		;
	CMPI R5, 0x1		;
	JEQ alpha_aux		;
	MOVI R14, 0x4B		; // Contador
	MOVI R5, 0x3AD77	; // Transparencia
	LDR R5, R5		;
	CMPI R5, 0x1		;
	JEQ alpha_aux		;
	MOVI R14, 0x64		; // Contador
	MOVI R5, 0x3AD78	; // Transparencia
	LDR R5, R5		;
alpha_aux:
	MOVR R5, R14	    	; // Valor de la transparencia
	MOVI R14, 0x0		; // Contador
	MOVI R2, 0x1D4C0	; // Direccion Rojos
	MOVI R3, 0x27100	; // Direccion Verdes
	MOVI R4, 0x30D40	; // Direccion Blue
	MOVI R11, 0x0		; // ROM Rojos
	MOVI R12, 0x9C40	; // ROM Verdes
	MOVI R13, 0x13880	; // ROM Blue
	MOVI R15, 0x64		; // 100
	SUB R7, R15, R5		; // R7 = a = 100 - transparencia degradado
alpha_composition_for:
	CMPI R14, 0x9C40		;
	JEQ END			; // contador == 40000 -> termina
	LDRV V6, R2		; // vector RAM rojo
	LDRV V1, R3		; // vector RAM verde
	LDRV V2, R4		; // vector RAM azul
	LDRV V3, R11		; // vector ROM rojo
	LDRV V4, R12		; // vector ROM verde
	LDRV V5, R13		; // vector ROM azul
	MULVE V3, V3, R7	; // ROJO vector imagen * a
	MULVE V7, V6, R5	; // ROJO vector degradado * b
	ADDVV V6, V7, V3 	; // ROJO imagen*a + degradado*b
	DIVVE V7, V6, R15	; // ans / 100
	STRV R2, V7		; // guarda el vector rojo
	MULVE V4, V4, R7	; // VERDE vector imagen * a
	MULVE V7, V1, R5	; // VERDE vector degradado * b
	ADDVV V1, V7, V4 	; // VERDE imagen*a + degradado*b
	DIVVE V7, V1, R15	; // ans / 100
	STRV R3, V7		; // guarda el vector verde
	MULVE V5, V5, R7	; // AZUL vector imagen * a
	MULVE V7, V2, R5	; // AZUL vector degradado * b
	ADDVV V2, V7, V5 	; // AZUL imagen*a + degradado*b
	DIVVE V7, V2, R15	; // ans / 100
	STRV R4, V7		; // guarda el vector azul
	ADD R2, R2, R1		; // suma 4 a la direccion de las RAM
	ADD R3, R3, R1		;
	ADD R4, R4, R1		;
	ADD R11, R11, R1	; // suma 4 a la direccion de las ROM
	ADD R12, R12, R1	;
	ADD R13, R13, R1	;
	ADD R14, R14, R1	; // suma 4 al contador
	JMP alpha_composition_for ;
END:
	JMP END;
FIN
