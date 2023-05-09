%include "../include/io.mac"
%define COUNT 26
;; defining constants, you can use these as immediate values in your code
LETTERS_COUNT EQU 26

section .data
    extern len_plain
    x dd 0
    rotor dd 0
    direct dd 0
    letters time

section .text
    global rotate_x_positions
    global enigma
    extern printf

; void rotate_x_positions(int x, int rotor, char config[10][26], int forward);
rotate_x_positions:
    ;; DO NOT MODIFY
    push ebp
    mov ebp, esp
    pusha

    mov eax, [ebp + 8]  ; x
    mov ebx, [ebp + 12] ; rotor
    mov ecx, [ebp + 16] ; config (address of first element in matrix)
    mov edx, [ebp + 20] ; forward
    ;; DO NOT MODIFY
    ;; TODO: Implement rotate_x_positions
    ;; FREESTYLE STARTS HERE
   
    mov [x], eax
    mov [rotor], ebx
    mov [direct], edx

    xor eax, eax
    xor ebx, ebx
    xor edx, edx

    cmp dword [direct], 0
    je right ; if forward is 0, rotate right

left:
    mov eax, [rotor]
    imul eax, eax, LETTERS_COUNT
    mov edi, ecx
    add edi, eax ; edi now points to the beginning of the rotor row

for_left:
    cmp ebx, LETTERS_COUNT
    jge endfor

    mov dl, byte [edi + ebx]
    sub dl, byte [x]
    cmp dl, 'A'
    jge done_left
    add dl, LETTERS_COUNT

done_left:
    mov byte [edi + ebx], dl
    inc ebx
    jmp for_left

endfor:
    jmp end

right:

    jmp end

end:



    ;; FREESTYLE ENDS HERE
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY

; void enigma(char *plain, char key[3], char notches[3], char config[10][26], char *enc);
enigma:
    ;; DO NOT MODIFY
    push ebp
    mov ebp, esp
    pusha

    mov eax, [ebp + 8]  ; plain (address of first element in string)
    mov ebx, [ebp + 12] ; key
    mov ecx, [ebp + 16] ; notches
    mov edx, [ebp + 20] ; config (address of first element in matrix)
    mov edi, [ebp + 24] ; enc
    ;; DO NOT MODIFY
    ;; TODO: Implement enigma
    ;; FREESTYLE STARTS HERE


    ;; FREESTYLE ENDS HERE
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY