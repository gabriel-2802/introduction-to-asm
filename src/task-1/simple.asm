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
    cmp eax, ecx
    jge end
    mov byte bl, [esi + eax]
    add bl, dl

    ; testam daca am depasit litera 'Z'
    ; in caz afirmativ, scadem 26
    cmp bl, 'Z'
    jle write
    sub bl, 26

    ; daca litera nou criptata nu e mai mare decat 'Z', o scriem in enc_string
write:
    mov byte [edi + eax], bl
    inc eax
    jmp cript_letter

end:
    ;; Your code ends here
    
    ;; DO NOT MODIFY

    popa
    leave
    ret
    
    ;; DO NOT MODIFY
