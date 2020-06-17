org 	100h

section .text

	mov 	dx, msg
	call 	w_strng

	xor 	si, si 	;lo mimso que: mov si, 0000h
	mov	bl,0d
lupi:	call 	kb
	sub 	al,30h
	add 	al,bl
	mov	bl,al
	cmp 	si, 4d
	je	validar
	inc 	si
	jmp 	lupi

validar:mov 	ax,bx
	mov 	bl,5d
	div	bl
	cmp 	al,1d
	je	prm1
	cmp 	al,2d
	je	prm2
	cmp 	al,3d
	je	prm3
	cmp 	al,4d
	je	prm4
	cmp 	al,5d
	je	prm5
	cmp 	al,6d
	je	prm6
	cmp 	al,7d
	je	prm7
	cmp 	al,8d
	je	prm8
	cmp 	al,9d
	je	prm9
	cmp 	al,10d
	je	prm10


prm1:	mov 	dx, nl
	call	w_strng
	mov 	dx, p1
	call 	w_strng
	call 	kb	; solo detenemos la ejecución
	int 	20h

prm2:	mov 	dx, nl
	call	w_strng
	mov 	dx, p2
	call 	w_strng
	call 	kb	; solo detenemos la ejecución
	int 	20h

prm3:	mov 	dx, nl
	call	w_strng
	mov 	dx, p3
	call 	w_strng
	call 	kb	; solo detenemos la ejecución
	int 	20h

prm4:	mov 	dx, nl
	call	w_strng
	mov 	dx, p4
	call 	w_strng
	call 	kb	; solo detenemos la ejecución
	int 	20h

prm5:	mov 	dx, nl
	call	w_strng
	mov 	dx, p5
	call 	w_strng
	call 	kb	; solo detenemos la ejecución
	int 	20h

prm6:	mov 	dx, nl
	call	w_strng
	mov 	dx, p6
	call 	w_strng
	call 	kb	; solo detenemos la ejecución
	int 	20h

prm7:	mov 	dx, nl
	call	w_strng
	mov 	dx, p7
	call 	w_strng
	call 	kb	; solo detenemos la ejecución
	int 	20h
prm8:	mov 	dx, nl
	call	w_strng
	mov 	dx, p8
	call 	w_strng
	call 	kb	; solo detenemos la ejecución
	int 	20h
prm9:	mov 	dx, nl
	call	w_strng
	mov 	dx, p9
	call 	w_strng
	call 	kb	; solo detenemos la ejecución
	int 	20h

prm10:	mov 	dx, nl
	call	w_strng
	mov 	dx, p10
	call 	w_strng
	call 	kb	; solo detenemos la ejecución
	int 	20h

mostrar:mov 	dx, nl
	call	w_strng
	mov	byte [300h+si], "$"
	mov 	dx, 300h
	call 	w_strng

	call 	kb	; solo detenemos la ejecución
	int 	20h

texto:	mov 	ah, 00h
	mov	al, 03h
	int 	10h
	ret

kb: 	mov	ah, 1h
	int 	21h
	ret

w_strng:mov	ah, 09h
	int 	21h
	ret

section .data

msg 	db 	"Ingrese los ultimos 5 digitos de su carnet: $"
p1	db	"Solo necesito el 0$"
p2	db	"Aun se pasa$"
p3	db	"Hay salud$"
p4	db	"Me recupero$"
p5	db	"En el segundo$"
p6	db	"Peor es nada$"
p7	db	"Muy bien$"
p8	db	"Colocho$"
p9	db	"Siempre me esfuerzo$"
p10	db	"Perfecto solo Dios$"

nl	db 	0xA, 0xD, "$"
