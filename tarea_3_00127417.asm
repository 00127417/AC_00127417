	org 100h

	; EJERCICIO 1
	; 00127417: ultimos 5 digitos -> 2,7,4,1,7
	; promedio: 4.2  


	mov 	ax, 2d
	mov 	bx, 7d
	add 	ax, bx
	mov 	bx, 4d
	add 	ax, bx
	mov 	bx, 1d
	add 	ax, bx
	mov 	bx, 7d
	add 	ax, bx
	mov 	bx, 5d
	div 	bx

    	;iterador
	mov 	di, 0d
	;se obtiene el caracter   
inicio: mov	al, [com+di]
    	;colocando en la pocision 
	mov 	[di+200h],al
	;aumenta el iterador
	inc	di
	loop	inicio

	int 20h

	section .data
	com	db	"Me recupero"
	
	;guarda el tamaño de la variable com
	len	equ	$-com


;Ejercico 2

	org 100h

	mov ax, 2d
	mov bx,2d
	mov di, 0d
;primer loop que abarca los datos de menos de 8 bit
inicio: cmp di, 5d
	je inicio2
	mul bx
	mov 	[di+210h],ax
	inc	di
	loop	inicio

;loop que abarca los datos de mas de 8 bit
inicio2: cmp di, 10d
	je fin
	mul bx
	inc di
	mov 	[di+210h],ax
	inc di
	loop	inicio2

fin:	int 20h


