section .data
    aux dd 0
    initial_x dd 0
    initial_y dd 0
section .text
    global bonus
    extern printf

bonus:
    ;; DO NOT MODIFY
    push ebp
    mov ebp, esp
    pusha

    mov eax, [ebp + 8]	; x
    mov ebx, [ebp + 12]	; y
    mov ecx, [ebp + 16] ; board

    ;; DO NOT MODIFY
    ;; FREESTYLE STARTS HERE
    ; avem nevoie de ecx pentru shifare
    mov edi, [ebp + 16]
    mov ecx, [ebp + 12]
    mov dword [initial_x], eax
    mov dword [initial_y], ebx
    ; vom calcula si retine in eax, setul de biti corespunzator liniei x
casex_0:
    cmp eax, 0
    jne casex_1
    xor eax, eax
    mov eax, 4
    jmp end_case

casex_1:
    cmp eax, 1
    jne casex_2
    xor eax, eax
    mov eax, 5
    jmp end_case

casex_2:
    cmp eax, 2
    jne casex_3
    xor eax, eax
    mov eax, 6
    jmp end_case

casex_3:
    cmp eax, 3
    jne casex_4
    xor eax, eax
    mov eax, 7
    jmp end_case

casex_4:
    cmp eax, 4
    jne casex_5
    xor eax, eax
    mov eax, 0
    jmp end_case

casex_5:
    cmp eax, 5
    jne casex_6
    xor eax, eax
    mov eax, 1
    jmp end_case

casex_6:
    cmp eax, 6
    jne casex_7
    xor eax, eax
    mov eax, 2
    jmp end_case

casex_7:
    cmp eax, 7
    jne end_case
    xor eax, eax
    mov eax, 3
    jmp end_case

end_case:

upper_line:
    cmp dword [initial_x], 7
    jge lower_line
    mov dword [aux], eax
    inc eax

    cmp eax, 8
    jne  upper_right
    xor eax, eax

upper_right:
    cmp ecx, 7
    je upper_left

    inc ecx
    xor edx, edx
    mov dl, 1
    shl dl, cl
    mov [edi + eax], dl
    dec ecx

upper_left:
    cmp ecx, 0
    je prep_lower_line

    dec ecx
    xor edx, edx
    mov dl, 1
    shl dl, cl
    or dl, [edi + eax]
    mov [edi + eax], dl
    inc ecx

prep_lower_line:
    mov eax, [aux]

lower_line:
    cmp dword [initial_x], 0
    je end

    dec eax

    cmp eax, -1
    jne  lower_right
    mov eax, 7

lower_right:
    cmp ecx, 7
    je lower_left

    inc ecx
    xor edx, edx
    mov dl, 1
    shl dl, cl
    mov [edi + eax], dl
    dec ecx

lower_left:
    cmp ecx, 0
    je end

    dec ecx
    xor edx, edx
    mov dl, 1
    shl dl, cl
    or dl, [edi + eax]
    mov [edi + eax], dl

end:


    ;; FREESTYLE ENDS HERE

    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY