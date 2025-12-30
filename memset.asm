;;
;; EPITECH PROJECT, 2025
;; memset
;; File description:
;; memset
;;

section .text
    global memset

memset:
    xor al, al
    xor r8, r8
    mov al, sil
.loop:
    cmp rdx, 0
    je .done
    mov byte [rdi + r8], al
    inc r8
    dec rdx
    jmp .loop

.done:
    mov rax, rdi
    ret