%include "../include/io.mac"
%define LAST_POS 25
;; defining constants, you can use these as immediate values in your code
LETTERS_COUNT EQU 26

section .data
    extern len_plain
    x dd 0
    rotor dd 0
    direct dd 0
    letter db 0
    done dd 0

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
   
   ; folosim var globale pt a nu mai face push si pop
    mov [x], eax
    mov [rotor], ebx
    mov [direct], edx
    mov edi, ecx

    xor eax, eax
    xor ebx, ebx
    xor edx, edx
    xor ecx, ecx

    ; eax - offsetul pt rotorul cerut
    mov eax, [rotor]
    imul eax, 26
    imul eax, 2

    ; vom modfica 2 linii
    mov dword [done], 0
    jmp fist_row

second_row:
    ; daca suntem la linia 2, atunci offsetul este eax + 26
    add eax, LETTERS_COUNT

fist_row:
    ; daca forward e 0, atunci shiftarea este la stanga
    xor ebx, ebx
    xor ecx, ecx
    cmp dword [direct], 0
    jne shift_right

    ; pentru simplitate vom shita cu cate o pozitie de x ori
shift_left:
    cmp ebx, [x]
    jge end

    ; salvam prima litera
    mov dl, byte [edi + eax]
    mov byte [letter], dl

    ; parcurgem vectorul de la stanga la dreapta
    xor ecx, ecx
for_left:
    cmp ecx, LAST_POS
    jge for_left_end
    
    ; echivalentul v[i + 1] = v[i]
    add eax, ecx
    mov dl, [edi + eax + 1]
    mov [edi + eax], dl
    sub eax, ecx

    inc ecx
    jmp for_left

for_left_end:
    ; la finalul unei shiftari, punem prima litera pe ultima pozitie
    mov byte dl, [letter]
    mov byte [edi + eax + LAST_POS], dl
    inc ebx
    jmp shift_left
   
shift_right:
    cmp ebx, [x]
    jge end
    ; salvam ultima litera
    mov dl, byte [edi + eax + LAST_POS]
    mov byte [letter], dl

    ; parcurgem vectorul de la dreapta la stanga
    xor ecx, ecx
    mov ecx, LAST_POS
for_right:
    cmp ecx, 0
    jle for_right_end

    ; echivalentul v[i - 1] = v[i]
    add eax, ecx
    mov dl, [edi + eax - 1]
    mov [edi + eax], dl
    sub eax, ecx

    dec ecx
    jmp for_right

for_right_end:
    ; la finalul unei shiftari, punem ultima litera pe prima pozitie
    mov byte dl, [letter]
    mov byte [edi + eax], dl
    inc ebx
    jmp shift_right

end:
    ; la final trebuie sa verificam daca am shiftat 2 linii
    inc dword [done]
    cmp dword [done], 2
    jge final
    jmp second_row

final:

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