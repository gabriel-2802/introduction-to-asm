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
    offset dd 0

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
    xor ecx, ecx
first_for:
    cmp ecx, [length]
    jge first_for_end
    
    ; initializam contorul 2
second_for:
    xor ebx, ebx
    mov ebx, ecx
    cmp ecx, [length]
    jge second_for_end

    
    mov byte al, [edx + ecx + 2]

    inc ebx
second_for_end:
    inc ecx

first_for_end:


    ;; Your code ends here
    

    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY