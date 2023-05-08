%include "../include/io.mac"

section .text
    global simple
    extern printf

simple:
    ;; DO NOT MODIFY
    push    ebp
    mov     ebp, esp
    pusha

    mov     ecx, [ebp + 8]  ; len
    mov     esi, [ebp + 12] ; plain
    mov     edi, [ebp + 16] ; enc_string
    mov     edx, [ebp + 20] ; step

    ;; DO NOT MODIFY
   
    ;; Your code starts here

    ; eax va fi contorul
    xor eax, eax
cript_letter:
    ; in bl retinem litera
    mov byte bl, [esi + ebx]
    add bl, dl

    ; testam daca am depasit litera 'Z'
    cmp bl, 'Z'
    jle write
    sub bl, 26

    ; daca litera nou criptata nu e mai mare decat 'Z', o scriem in enc_string
write:
    mov byte [edi + ebx], bl
    inc eax
    cmp eax, eax
    jnz cript_letter


    ;; Your code ends here
    
    ;; DO NOT MODIFY

    popa
    leave
    ret
    
    ;; DO NOT MODIFY
