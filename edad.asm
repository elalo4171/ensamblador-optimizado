TITLE edad									; Se define un titulo para el programa
.model small								; Se define el tamaño del programa 
.stack  									; Se inicializa el segmento de pila, en este caso toma el tamaño por default						
.data										; Inicio del segmento de datos
	juan db 20								; Se define un espacio en memoria para almacenar un dato
	msg db "Es mayor de edad ",10,13,"$"	; Se define un espacio en memoria para una cadena
.code										; Se inicializa el segmento de codigo

mov ax, seg @data							; Se inicializa el segmento 
mov ds, ax									; de datos en el registro ds

DECISION:									; Etiqueta para controlar la estructura de decision
mov al, juan								; Se asigna al registro al, el valor que tiene "juan"
cmp al, 17									; Se compara el registro al, con el valor de 17
jg MAYOR 									; Saltar a la etiqueta MAYOR si AL es mayor a 17
jmp SALIR 									; Saltar a la etiqueta salir

MAYOR:										; Etiqueta mayor
mov ah, 09h									; Se prepara el registro ah con la funcion 09h para imprimir datos en pantalla
lea dx, msg									; Se mueve la dirección del mensaje a escribir al registro dx  
int 21h										; Se llama a la int 21 h

SALIR:										; Etiqueta para salir
mov ah,4ch									; Se hace uso de la funcion 04h pra devolver el control al SO
int 21h										; Se manda llamar la interrupcion 21h
end 										; FIN DEL PROGRAMA