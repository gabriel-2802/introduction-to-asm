%include "../include/io.mac"


struc proc
    .pid: resw 1
    .prio: resb 1
    .time: resw 1
endstruc

section .text
    global sort_procs
    extern printf
section .data
    length dd 0
    aux dd 0
    ilen dd 0
    jlen dd 0
    procs dd 0

sort_procs:
    ;; DO NOT MODIFY
    enter 0,0
    pusha

    mov edx, [ebp + 8]      ; processes
    mov eax, [ebp + 12]     ; length
    ;; DO NOT MODIFY

    ;; Your code starts here
    mov dword [length], eax 

    ; aplicam selection sort
    ; ecx -> i, ebx -> j
    xor edx, edx
    xor eax, eax
    xor ecx, ecx

first_for:
    cmp ecx, dword [length]
    jge end

    ;offsetul pt i
    push ecx
    imul ecx, proc_size
    mov [ilen], ecx
    pop ecx

    xor ebx, ebx
    mov ebx, ecx
second_for:
    ; j = i + 1
    inc ebx

    cmp ebx, dword [length]
    jge second_for_end
    
    ;offsetul pt j
    push ebx
    imul ebx, proc_size
    mov [jlen], ebx

    mov edi, dword [ilen]
    mov edx, dword [jlen]

prio:
    mov al, byte [ebp + 8 + edi + proc.prio]
    mov bl, byte [ebp + 8 + edx + proc.prio]

    cmp al, bl
    je time
    jg swap
    jl finalise

time:
    mov ax, [ebp + 8 + edi + proc.time]
    mov bx, [ebp + 8 + edx + proc.time]

    cmp ax, bx
    je id
    jg swap
    jl finalise

id: 
    mov ax, [ebp + 8 + edi + proc.pid]
    mov bx, [ebp + 8 + edx + proc.pid]
    cmp ax, bx
    jg swap
    jle finalise

swap:
    mov al, [ebp + 8 + edi + proc.prio]
    mov bl, [ebp + 8 + edx + proc.prio]
    mov [ebp + 8 + edi + proc.prio], bl
    mov [ebp + 8 + edx + proc.prio], al

    mov ax, [ebp + 8 + edi + proc.time]
    mov bx, [ebp + 8 + edx + proc.time]
    mov [ebp + 8 + edi + proc.time], bx
    mov [ebp + 8 + edx + proc.time], ax

    mov ax, [ebp + 8 + edi + proc.pid]
    mov bx, [ebp + 8 + edx + proc.pid]
    mov [ebp + 8 + edi + proc.pid], bx
    mov [ebp + 8 + edx + proc.pid], ax

finalise:
    ; revenim la val initala j
    pop ebx
    jmp second_for
second_for_end:
    inc ecx
    jmp first_for

end:


    ;; Your code ends here
    

    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY