;;
;; EPITECH PROJECT, 2025
;; _
;; File description:
;; _
;;

section .text
    global memcpy

memcpy:
    test rdx, rdx
    je .done
    mov rax, rdi

.loop:
    cmp rdx, 0
    je .done
    mov al, [rsi]
    mov [rdi], al
    inc rsi
    inc rdi
    dec rdx
    jmp .loop

.done:
    ret