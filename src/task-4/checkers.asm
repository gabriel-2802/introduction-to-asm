
%define TABLE 8
section .data
    done dd 0
section .text
	global checkers

checkers:
    ;; DO NOT MODIFY
    push ebp
    mov ebp, esp
    pusha

    mov eax, [ebp + 8]	; x
    mov ebx, [ebp + 12]	; y
    mov ecx, [ebp + 16] ; table

    ;; DO NOT MODIFY
    ;; FREESTYLE STARTS HERE
    mov dword [done], 0

    ; verificam daca suntem pe ultima linie
    cmp eax, 7
    je lower_line

    inc eax
right:
    ; verificam daca suntem pe ultima coloana
    cmp ebx, 7
    je left
    
    inc ebx
    add ecx, ebx
    mov byte [ecx + TABLE * eax], 1

    ; revenim la primul element
    sub ecx, ebx
    dec ebx

left:
    ; verificam daca suntem pe prima coloana
    cmp ebx, 0
    je prep_lower_line
    
    dec ebx
    add ecx, ebx
    mov byte [ecx + TABLE * eax], 1

    ; revenim la primul element
    sub ecx, ebx
    inc ebx

prep_lower_line:
    dec eax
    cmp dword [done], 1
    je end

lower_line:
    ; verificam daca suntem pe prima linie
    cmp eax, 0
    jle end

    dec eax
    inc dword [done]
    jmp right

end:
    ;; FREESTYLE ENDS HERE
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY