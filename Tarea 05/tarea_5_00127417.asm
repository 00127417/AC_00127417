org 	100h

section .text

	call 	grafico	; Llamada a iniciar modo grafico 13h

	xor 	si, si
	xor 	di, di

	mov 	si, 135d ; X -> Columna
	mov 	di, 50d ; Y -> Fila
	call 	linea_h

	mov 	si, 135d ; X -> Columna
	mov 	di, 160d ; Y -> Fila
	call 	linea_h

	mov 	si, 145d ; X -> Columna
	mov 	di, 70d ; Y -> Fila
	call 	linea_hp

	mov 	si, 145d ; X -> Columna
	mov 	di, 140d ; Y -> Fila
	call 	linea_hp

	mov 	si, 135d ; X -> Columna
	mov 	di, 50d ; Y -> Fila
	call 	linea_aig

	mov 	si, 185d ; X -> Columna
	mov 	di, 50d ; Y -> Fila
	call 	linea_adg

	mov 	si, 205d ; X -> Columna
	mov 	di, 140d ; Y -> Fila
	call 	linea_ai

	mov 	si, 115d ; X -> Columna
	mov 	di, 140d ; Y -> Fila
	call 	linea_ad

	mov	si, 115d ; X -> Columna
	mov 	di, 70d ; Y -> Fila
	call 	linea_v

	mov	si, 205d ; X -> Columna
	mov 	di, 70d ; Y -> Fila
	call 	linea_v

	mov	si, 135d ; X -> Columna
	mov 	di, 80d ; Y -> Fila
	call 	linea_vp

	mov	si, 185d ; X -> Columna
	mov 	di, 80d ; Y -> Fila
	call 	linea_vp

	mov 	si, 145d ; X -> Columna
	mov 	di, 70d ; Y -> Fila
	call 	linea_aip

	mov 	si, 175d ; X -> Columna
	mov 	di, 70d ; Y -> Fila
	call 	linea_adp

	mov 	si, 185d ; X -> Columna
	mov 	di, 130d ; Y -> Fila
	call 	linea_aipp

	mov 	si, 135d ; X -> Columna
	mov 	di, 130d ; Y -> Fila
	call 	linea_adpp

	call 	kb		; Utilizamos espera de alguna tecla

	int 	20h

grafico:mov	ah, 00h
	mov	al, 13h
	int 	10h
	ret

pixel:	mov	ah, 0Ch
	mov	al, 1010b
	int 	10h
	ret

linea_h: 
lupi_h:	mov 	cx, 0d ; Columna 
	add 	cx, si
	mov	dx, di ; Fila
	call 	pixel
	inc 	si
	cmp 	si, 185d
	jne 	lupi_h
	ret

linea_hp: 
lupi_hp:	mov 	cx, 0d ; Columna 
	add 	cx, si
	mov	dx, di ; Fila
	call 	pixel
	inc 	si
	cmp 	si, 175d
	jne 	lupi_hp
	ret

linea_v:
lupi_v:	mov 	cx, si ; Columna 
	mov	dx, 0d ; Fila
	add 	dx, di
	call 	pixel
	inc 	di
	cmp 	di, 140d
	jne 	lupi_v
	ret

linea_vp:
lupi_vp:	mov 	cx, si ; Columna 
	mov	dx, 0d ; Fila
	add 	dx, di
	call 	pixel
	inc 	di
	cmp 	di, 130d
	jne 	lupi_vp
	ret

linea_adg:
lupi_adg:	mov 	cx, si ; Columna 
	mov	dx, 0d ; Fila
	add 	dx, di
	call 	pixel
	inc 	di
    	inc	si
	cmp 	di, 70d
	jne 	validadg
validadg:	cmp	si,205d
	jne 	lupi_adg	
	ret

linea_aig:
lupi_aig:	mov 	cx, si ; Columna 
	mov	dx, 0d ; Fila
	add 	dx, di
	call 	pixel
	inc 	di
    	dec	si
	cmp 	di, 70d
	jne 	valig
valig:	cmp	si,115d
	jne 	lupi_aig	
	ret

linea_ad:
lupi_ad:	mov 	cx, si ; Columna 
	mov	dx, 0d ; Fila
	add 	dx, di
	call 	pixel
	inc 	di
    	inc	si
	cmp 	di, 160d
	jne 	validad
validad:	cmp	si,135d
	jne 	lupi_ad	
	ret

linea_ai:
lupi_ai:	mov 	cx, si ; Columna 
	mov	dx, 0d ; Fila
	add 	dx, di
	call 	pixel
	inc 	di
    	dec	si
	cmp 	di, 160d
	jne 	vali
vali:	cmp	si,185d
	jne 	lupi_ai	
	ret






linea_adp:
lupi_adp:	mov 	cx, si ; Columna 
	mov	dx, 0d ; Fila
	add 	dx, di
	call 	pixel
	inc 	di
    	inc	si
	cmp 	di, 80d
	jne 	validadp
validadp:	cmp	si,185d
	jne 	lupi_adp	
	ret

linea_aip:
lupi_aip:	mov 	cx, si ; Columna 
	mov	dx, 0d ; Fila
	add 	dx, di
	call 	pixel
	inc 	di
    	dec	si
	cmp 	di, 80d
	jne 	valip
valip:	cmp	si,135d
	jne 	lupi_aip	
	ret

linea_adpp:
lupi_adpp:	mov 	cx, si ; Columna 
	mov	dx, 0d ; Fila
	add 	dx, di
	call 	pixel
	inc 	di
    	inc	si
	cmp 	di, 140d
	jne 	validadpp
validadpp:	cmp	si,145d
	jne 	lupi_adpp	
	ret

linea_aipp:
lupi_aipp:	mov 	cx, si ; Columna 
	mov	dx, 0d ; Fila
	add 	dx, di
	call 	pixel
	inc 	di
    	dec	si
	cmp 	di, 140d
	jne 	valipp
valipp:	cmp	si,175d
	jne 	lupi_aipp
	ret



kb: 	mov	ah, 00h
	int 	16h
	ret

section .data