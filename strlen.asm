;;
;; EPITECH PROJECT, 2025
;; strlen
;; File description:
;; strlen
;;

section .text
    global strlen

strlen:
    mov rax, rdi
    xor rcx, rcx

.loop:
    cmp byte [rax], 0
    je .done
    inc rax
    inc rcx
    jmp .loop

.done:
    mov rax, rcx
    ret