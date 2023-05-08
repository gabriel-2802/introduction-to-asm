
%define TABLE 8
section .data

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
upper_line:
    cmp eax, 7
    je lower_line

    inc eax
upper_right:
    cmp ebx, 7
    je upper_left

    inc ebx
    add ecx, ebx
    mov byte [ecx + TABLE * eax], 1
    ; revenim la table
    sub ecx, ebx
    dec ebx

upper_left:
    cmp ebx, 0
    je prep_lower_line
    
    dec ebx
    add ecx, ebx
    mov byte [ecx + TABLE * eax], 1
    ; revenim la table
    sub ecx, ebx
    inc ebx

prep_lower_line:
    dec eax

lower_line:
    cmp eax, 0
    jle end

    dec eax
down_right:
      cmp ebx, 7
      je down_left

      inc ebx
      add ecx, ebx
      mov byte [ecx + TABLE * eax], 1
      ; revenim la table
      sub ecx, ebx
      dec ebx

down_left:
    cmp ebx, 0
    je end
    dec ebx
    add ecx, ebx
    mov byte [ecx + TABLE * eax], 1
    ; revenim la table
    sub ecx, ebx
    inc ebx

end:
    ;; FREESTYLE ENDS HERE
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY