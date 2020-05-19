org 	100h

section .text

	call 	texto	
	call 	cursor
	call 	phrase1
    call 	phrase2
    call 	phrase3
    call 	phrase4
	call	kbwait

	int 	20h

texto:	mov 	ah, 00h
	mov	al, 03h
	int 	10h
	ret

cursor: mov	ah, 01h
	mov 	ch, 00000000b
	mov 	cl, 00001110b
		;   IRGB
	int 	10h
	ret

w_char:	mov 	ah, 09h
	mov 	al, cl
	mov 	bh, 0h
	mov 	bl, 00001111b
	mov 	cx, 1h
	int 	10h
	ret

kbwait: mov 	ax, 0000h
	int 	16h
	ret


m_cursr1:mov 	ah, 02h
	mov 	dx, di  ; columna
	mov 	dh, 5d ; fila
	mov 	bh, 0h
	int 	10h
	ret

m_cursr2:mov 	ah, 02h
	mov 	dx, di  ; columna
	mov 	dh, 10d ; fila
	mov 	bh, 0h
	int 	10h
	ret

m_cursr3:mov 	ah, 02h
	mov 	dx, di  ; columna
	mov 	dh, 15d ; fila
	mov 	bh, 0h
	int 	10h
	ret

m_cursr4:mov 	ah, 02h
	mov 	dx, di  ; columna
	mov 	dh, 20d ; fila
	mov 	bh, 0h
	int 	10h
	ret


phrase1:	mov 	di, 10d
lupi:	mov 	cl, [msg+di-10d]
	call    m_cursr1
	call 	w_char
	inc	di
	cmp 	di, len1
	jb	lupi
	ret

phrase2:	mov 	di, 29d
lupi2:	mov 	cl, [msg2+di-29d]
	call    m_cursr2
	call 	w_char
	inc	di
	cmp 	di, len2
	jb	lupi2
	ret

phrase3:	mov 	di, 20d
lupi3:	mov 	cl, [msg3+di-20d]
	call    m_cursr3
	call 	w_char
	inc	di
	cmp 	di, len3
	jb	lupi3
	ret

phrase4:	mov 	di, 15d
lupi4:	mov 	cl, [msg4+di-15d]
	call    m_cursr4
	call 	w_char
	inc	di
	cmp 	di, len4
	jb	lupi4
	ret


section .data
msg	    db 	"When al fin descargas GTAV y puedes jugar..."
len1 	equ	$-msg+10d

msg2	db 	"\(UwU)/"
len2 	equ	$-msg2+29d

msg3	db 	"But Nelson deja tarea"
len3 	equ	$-msg3+20d

msg4	db 	"(",0F5h,095h,0DCh,0A2h,")",0F5h,"    ",0C1h,0C4h,0C4h,0C1h,"      "
len4 	equ	$-msg4+15d