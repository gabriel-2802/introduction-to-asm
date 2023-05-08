%include "../include/io.mac"

struc proc
    .pid: resw 1
    .prio: resb 1
    .time: resw 1
endstruc

section .text
    global sort_procs

section .data
    length dd 0
    aux dd 0
    ilen dd 0
    jlen dd 0

sort_procs:
    ;; DO NOT MODIFY
    enter 0,0
    pusha

    mov edx, [ebp + 8]      ; processes
    mov eax, [ebp + 12]     ; length
    ;; DO NOT MODIFY

    ;; Your code starts here
    mov dword [length], eax
    xor eax, eax

    ; aplicam selection sort
    ; ecx -> i, ebx -> j
    xor ecx, ecx
first_for:
    cmp ecx, [length]
    jge first_for_end

    ; initializam contorul 2

    ; calculam offset ul pt i
    push ecx
    imul ecx, proc_size
    mov dword [ilen], ecx
    pop ecx

second_for:
    xor ebx, ebx
    mov ebx, ecx
    ; j = i + 1
    inc ebx
    cmp ebx, [length]
    jge second_for_end

    ; calculez offset petru j
    push ebx
    imul ebx, proc_size
    mov dword [jlen], ebx
    pop ebx

    xor edi, edi
    xor eax, eax
    mov edi, dword [ilen]
    mov al, [edx + edi + proc.prio]
    mov edi, dword [jlen]
    mov ah, [edx + edi + proc.prio]

check_prio:
    cmp al, ah
    jl second_for_inc
    jg swap
    je check_time


check_time:
    ;am rams fara registri, deci va trebuie sa folosesc ebx
    push ebx
    xor eax, eax
    xor ebx, ebx
    xor edi, edi

    mov edi, dword [ilen]
    mov ax, [edx + edi + proc.time]

    xor edi, edi
    mov edi, dword [jlen]
    mov bx, [edx + edi + proc.time]

    cmp ax, bx
    jl second_for_inc
    je check_id
    jg swap

check_id:
    xor eax, eax
    xor ebx, ebx
    xor edi, edi

    mov edi, dword [ilen]
    mov ax, [edx + edi + proc.pid]

    xor edi, edi
    mov edi, dword [jlen]
    mov bx, [edx + edi + proc.pid]

    cmp ax, bx
    jle second_for_inc
    jg swap

swap:
    ; structura depaseste 4 octetim deci va trebuie sa o mutam buc cu buc
    xor eax, eax
    xor ebx, ebx
    xor edi, edi

    mov edi, dword [ilen]
    mov al, 

second_for_inc:
    ;incrementan j
    pop ebx
    inc ebx

second_for_end:
    ;incrementan i
    inc ecx

first_for_end:


    ;; Your code ends here
    

    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY