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
    imul eax, 5
    mov dword [length], eax
    mov edi, [ebp + 8]

    ; aplicam selection sort
    ; ecx -> i, edx -> j
    ;PRINTF32 `length = %d\n\0`, dword [length]
    xor edx, edx
    xor eax, eax
    xor ecx, ecx
first_for:
    cmp ecx, dword [length]
    jge end

    xor edx, edx
    mov edx, ecx

second_for:
    ; j = i + 1
    add edx, proc_size

    cmp edx, dword [length]
    jge second_for_end
    ; PRINTF32 `I =i %d, j = %d\n\0`, ecx, edx
prio:
    mov al, [edi + ecx + proc.prio]
    mov bl, [edi + edx + proc.prio]

    cmp al, bl
    je time
    jl final
    jg swap

time:
    mov ax, [edi + ecx + proc.time]
    mov bx, [edi + edx + proc.time]

    cmp ax, bx
    je pid
    jl final
    jg swap

pid:
    mov ax, [edi + ecx + proc.pid]
    mov bx, [edi + edx + proc.pid]

    cmp ax, bx
    jle final
    jg swap

swap:
    mov al, [edi + ecx + proc.prio]
    mov bl, [edi + edx + proc.prio]
    mov [edi + ecx + proc.prio], bl
    mov [edi + edx + proc.prio], al

    mov ax, [edi + ecx + proc.pid]
    mov bx, [edi + edx + proc.pid]
    mov [edi + ecx + proc.pid], bx
    mov [edi + edx + proc.pid], ax

    mov ax, [edi + ecx + proc.time]
    mov bx, [edi + edx + proc.time]
    mov [edi + ecx + proc.time], bx
    mov [edi + edx + proc.time], ax


final:
    jmp second_for
second_for_end:
    add ecx, proc_size
    jmp first_for

end:
    ;PRINTF32 `ecx = %d\n\0`, ecx
    ;; Your code ends here
    

    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY