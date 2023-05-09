%include "../include/io.mac"

    ;;
    ;;   TODO: Declare 'avg' struct to match its C counterpart
    ;;
struc avg
    .quo resw 1
    .remain resw 1
    endstruc

struc proc
    .pid: resw 1
    .prio: resb 1
    .time: resw 1
endstruc

    ;; Hint: you can use these global arrays
section .data
    prio_result dd 0, 0, 0, 0, 0
    time_result dd 0, 0, 0, 0, 0
    length dd 0

section .text
    global run_procs
    extern printf

run_procs:
    ;; DO NOT MODIFY

    push ebp
    mov ebp, esp
    pusha

    xor ecx, ecx

clean_results:
    mov dword [time_result + 4 * ecx], dword 0
    mov dword [prio_result + 4 * ecx],  0

    inc ecx
    cmp ecx, 5
    jne clean_results

    mov ecx, [ebp + 8]      ; processes
    mov ebx, [ebp + 12]     ; length
    mov eax, [ebp + 16]     ; proc_avg
    ;; DO NOT MODIFY
   
    ;; Your code starts here

    ; inmutlim length cu 5 pentru a putea parcurge vec de procese eficient
    imul ebx, proc_size
    mov [length], ebx

    ; pentru consecventa, am folosit edi ca inceputul vectorului de procese
    mov edi, [ebp + 8]
    mov esi, [ebp + 16]
    xor ecx, ecx

for:
    cmp ecx, dword [length]
    jge end_for
    xor eax, eax
    xor ebx, ebx
    mov al, [edi + ecx + proc.prio]
    mov bx, [edi + ecx + proc.time]

    cmp ecx, 0
    jg case1
    ;PRINTF32 `prio = %d, time = %d\n\0`, eax, ebx

case1:
    cmp byte al, 1
    jg case2
    inc dword [prio_result]
    add [time_result], ebx
    jmp final

case2:
    cmp byte al, 2
    jg case3
    inc dword [prio_result + 4]
    add [time_result + 4], ebx
    jmp final

case3:
    cmp byte al, 3
    jg case4
    inc dword [prio_result + 8]
    add [time_result + 8], ebx
    jmp final

case4:
    cmp byte al, 4
    jg case5
    inc dword [prio_result + 12]
    add [time_result + 12], ebx
    jmp final

case5:
    inc dword [prio_result + 16]
    add [time_result + 16], ebx
    jmp final

final:
    add ecx, proc_size
    jmp for
end_for:

    xor ebx, ebx
    ;contorul
loop:
    cmp ebx, 5
    jge end

    xor eax, eax
    xor ecx, ecx
    xor edx, edx

    mov eax, [time_result + ebx * 4]
    mov ecx, [prio_result + ebx * 4]
    PRINTF32 `prio = %d -> %d divided by %d \n\0`,ebx, eax, ecx
    xor edx, edx
    ; testam impartirea la 0
    cmp ecx, 0
    je zero
    div ecx

    mov [esi + ebx  * avg_size + avg.quo], eax
    mov [esi + ebx  * avg_size + avg.remain], dx
    jmp zero_done

zero:
    mov [esi + ebx  * avg_size + avg.quo], eax
    mov [esi + ebx  * avg_size + avg.remain], dx
zero_done:

    inc ebx
    jmp loop
end:

    PRINTF32 `end\n\0`


    ;; Your code ends here
    
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY