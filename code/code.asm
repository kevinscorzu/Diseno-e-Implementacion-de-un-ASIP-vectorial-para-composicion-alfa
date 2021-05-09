start:
	MOVI R10, 3AD6D		;
	LDR R10, R10		; // Obtiene la orientacion
	MOVI R2, 1D4C0		; // Direccion Rojos
	MOVI R3, 27100		; // Direccion Verdes
	MOVI R4, 30D40		; // Direccion Blue
select_orientation:
	MOVI R11, 0		; // Contador de las columnas
	MOVI R12, 0		; // Contador de las filas
	MOVI R1, 1		; // 1 de la suma
	CMPI R10, 0		;
	JEQ vertical_for_x	; // Salta a inicializar el degradado vertical
	CMPI R10, 1		;
	JEQ horizontal_for_x	; // Salta a inicializar el degradado horizontal
	CMPI R10, 2		;
	JEQ angular_for_x	; // Salta a inicializar el degradado angular
	CMPI R10, 3		;
	JEQ proposed_for_x 	; // Salta a inicilizar el degradado propuesto
vertical_for_y:
	ADD R12, R12, R1	; // Aumenta el contador de las filas
	MOVI R11, 0		; // Vuelve 0 el contador de columnas
	CMPI R12, C8		;
	JEQ degraded 		; // Salta a hacer la degradacion
vertical_for_x:
	CMP R11, C8		;
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
	MOVI R11, 0		; // Vuelve 0 el contador de columnas
	CMPI R12, C8		;
	JEQ degraded 		; // Salta a hacer la degradacion
horizontal_for_x:
	CMP R11, C8		;
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
	MOVI R11, 0		; // Vuelve 0 el contador de columnas
	CMPI R12, C8		;
	JEQ degraded 		; // Salta a hacer la degradacion
angular_for_x:
	CMP R11, C8		;
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
	MOVI R11, 0		; // Vuelve 0 el contador de columnas
	CMPI R12, C8		;
	JEQ degraded 		; // Salta a hacer la degradacion
proposed_for_x:
	CMP R11, C8		;
	JEQ proposed_for_y	; // Si recorrio todas las columnas vuelve a el for y
	ADD R5, R11, R12	; // x + y
	SUB R6, R11, R12	; // x - y
	STR R2, R5		; // Almacena el indice de las columnas en las memorias 
	STR R3, R5		;
	STR R4, R6		;
	ADD R2, R2, R1		; // Dirigue a la siguiente direccion de la memoria
	ADD R3, R3, R1		;
	ADD R4, R4, R1		;
	ADD R11, R11, R1	; // Aumenta el contador de las columnas
	JMP proposed_for_x	;
degraded:
	MOVI R14, 0		; // Contador
	MOVI R1, 4		; // 4
	MOVI R2, 1D4C0		; // Direccion Rojos
	MOVI R3, 27100		; // Direccion Verdes
	MOVI R4, 30D40		; // Direccion Blue
	MOVI R11, 3AD69		;
	LDR R11, R11		; // Intensidad Rojo
	MOVI R12, 3AD6A		;
	LDR R12, R12		; // Intensidad Verde
	MOVI R13, 3AD6B		;
	LDR R13, R13		; // Intensidad Azul
	MOVI R5, FF		; // 255
	MOVI R6, 64		; // 100
	MOVI R7, C8		; // 200
	MUL R11, R11, R5	; // R * 255
	DIV R11, R11, R6	; // R = R * 255 / 100
	DIV R11, R11, R7	; // Rsize = R * 255 / 100 / 255
	MUL R12, R12, R5	; // G * 255
	DIV R12, R12, R6	; // G = G * 255 / 100
	DIV R12, R12, R7	; // Gsize = G * 255 / 100 / 255
	MUL R13, R13, R5	; // B * 255
	DIV R13, R13, R6	; // B = B * 255 / 100
	DIV R13, R13, R7	; // Bsize = B * 255 / 100 / 255
gradient_for:
	CMPI R14, 9C40		;
	JEQ alpha_composition	; // contador == 40000 salte a la composicion alfa
	LDRV V1, R2		; // vector rojo
	LDRV V2, R3		; // vector verde
	LDRV V3, R4		; // vector azul
	MULVE V1, V1, R11	; // vector rojo * Rsize
	MULVE V2, V2, R12	; // vector verde * Gsize
	MULVE V3, V3, R13	; // vector azul * Bsize
	STRV R2, V1		; // guarda los resultados en memoria RAM
	STRV R3, V2		;
	STRV R4, V3		;
	ADD R2, R2, R1		; // suma 4 a la direccion
	ADD R3, R3, R1		;
	ADD R4, R4, R1		;
	ADD R14, R14, R1	; // suma 4 al contador
	JMP gradient_for	;
alpha_composition:
	MOVI R14, 0		; // Contador
	MOVI R5, 3AD6C		; // Transparencia
	MOVI R2, 1D4C0		; // Direccion Rojos
	MOVI R3, 27100		; // Direccion Verdes
	MOVI R4, 30D40		; // Direccion Blue
	MOVI R11, 0		; // ROM Rojos
	MOVI R12, 9C4F		; // ROM Verdes
	MOVI R13, 13880		; // ROM Blue
	MOVI R6, 64		; // 100
	SUB R7, R6, R5		; // 100 - transparencia degradado
	DIV R7, R7, R6		; // (100 - transparencia degradado) / 100
	DIV R6, R5, R6		; // transparencia degradado / 100
alpha_composition_for:
	CMP R14, 9C40		;
	JEQ END			; // contador == 40000 -> termina
	LDRV V6, R2		; // vector RAM rojo
	LDRV V1, R3		; // vector RAM verde
	LDRV V2, R4		; // vector RAM azul
	LDRV V3, R11		; // vector ROM rojo
	LDRV V4, R12		; // vector ROM verde
	LDRV V5, R13		; // vector ROM azul
	MULVE V3, V3, R7	; // ROJO vector imagen * a
	MULVE V6, V6, R6	; // ROJO vector degradado * b
	ADDVV V6, V6, V3 	; // ROJO imagen*a + degradado*b
	STRV R2, V6		; // guarda el vector rojo
	MULVE V4, V4, R7	; // VERDE vector imagen * a
	MULVE V1, V1, R6	; // VERDE vector degradado * b
	ADDVV V1, V1, V4 	; // VERDE imagen*a + degradado*b
	STRV R3, V1		; // guarda el vector verde
	MULVE V5, V5, R7	; // AZUL vector imagen * a
	MULVE V2, V2, R6	; // AZUL vector degradado * b
	ADDVV V2, V2, V5 	; // AZUL imagen*a + degradado*b
	STRV R4, V2		; // guarda el vector azul
	ADD R2, R2, R1		; // suma 4 a la direccion de las RAM
	ADD R3, R3, R1		;
	ADD R4, R4, R1		;
	ADD R11, R11, R1	; // suma 4 a la direccion de las ROM
	ADD R12, R12, R1	;
	ADD R13, R13, R1	;
	ADD R14, R14, R1	; // suma 4 al contador
	JMP alpha_composition_for ;		
END:
	MOVI R1, 45		;
