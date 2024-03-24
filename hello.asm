format mz
start:
		
          call clears
          
          mov si,text1                
          mov ax,cs
          call mem32

                          
          mov esi,eax
          mov ecx,1
          mov edx,2
                          
                          
          FOR1:                
                    mov ax,cx
                    mov bx,cx
                    call gotoxy
                    mov edi,eax
                    call copymem32
                                    
                    inc cx                
                    cmp ecx,16
                    JB FOR1                   
                          
          exitdo:                
                                    
                                    
                    exit:                
                              int 20h                
                              xor ah,ah
                              int 21h                
                                             
                
halt:
jmp halt
fill32:                
          push eax                
          push ebx                
          push ecx                
          push edx                
          push esi                
          push edi                
          push ebp                
          push ds                
          mov bp,0                
          mov ds,bp
          cmp edx,0
          JNZ FILL3211
          inc edx                
          FILL3211:
          FILL321:  
                    ds    
                    mov [edi],al
                    clc                
                    add edi,edx
                    dec ecx                
                    JNZ FILL321
                    pop ds                
                    pop ebp                
                    pop edi                
                    pop esi                
                    pop edx                
                    pop ecx                 
                    pop ebx                
                    pop eax                
                    RET 
                    
copymem32:
          push eax                
          push ebx                
          push ecx                
          push edx                
          push esi                
          push edi                
          push ebp                
          push ds                
          mov bp,0                
          mov ds,bp
          cmp edx,0
          JNZ COPYMEM3211
          inc edx                
          COPYMEM3211:
          cmp ecx,0
          JZ COPYMEM326
          COPYMEM321:
                    ds
                    mov al,[esi]
                    ds
                    mov [edi],al
                    clc                
                    add edi,edx
                    inc esi                
                    dec ecx                
                    JNZ COPYMEM321
                    COPYMEM326:
                    pop ds                
                    pop ebp                
                    pop edi                
                    pop esi                
                    pop edx                
                    pop ecx                 
                    pop ebx                
                    pop eax                
                    RET 
mem32:                
          push esi                
                          
          and eax,0ffffh
          clc                
          shl eax,4
          and esi,0ffffh
          clc                 
          add eax,esi
                          
          pop esi                
          RET 
gotoxy:                
          push ebx                
          push ecx                
          push edx                
          push esi                
          push edi                
          push ebp                
          mov si,ax
          mov di,bx
          and si,0fffh
          and di,0fffh
          xor cx,cx
          xor dx,dx
          mov ax,si
          mov bx,2                
          clc                
          mul bx                
          mov si,ax
          mov ax,di
          mov bx,160
          clc                
          mul bx                
          mov bx,si
          clc                
          add ax,bx
          and eax,0ffffh
          mov ebx,0b8000h
          clc                
          add eax,ebx
          pop ebp                
          pop edi                
          pop esi                
          pop edx                
          pop ecx                 
          pop ebx                
          RET                                       

print:                
          push ax                
          push bx                
          push cx                
          push dx                
          push di                
          push si                
          push bp                
          push es                
          mov ax,cs
          mov es,ax
          xchg dx,bp 
          mov bx,bp
          cs
          mov cl,[bx]
          inc bp                
          and cx,0ffh 
          mov bx,x
          cs
          mov dx,[bx]
          mov bx,color
          cs
          mov al,[bx]
          mov bl,al
          mov bh,0                
          mov al,0                
          mov ah,13h
          int 10h                
          pop es                
          pop bp                
          pop si                
          pop di                
          pop dx                
          pop cx                
          pop bx                
          pop ax                
          RET         
clears:
          push ax                
          push bx                
          push cx                
          push dx                
          push di                
          push si                
          push bp                
          push es    
          mov edi,0b8001h
          mov ecx,80*26
          mov al,017h
          mov edx,2
          call fill32
          mov edi,0b8000h
          mov ecx,80*26
          mov al,32
          mov edx,2
          call fill32
          pop es                
          pop bp                
          pop si                
          pop di                
          pop dx                
          pop cx                
          pop bx                
          pop ax                
          RET        


x     db 0     
y     db 0
color dw 07h
text1 db "hello world.....",13,10,0
string2 db "$",0

