;;
;; EPITECH PROJECT, 2025
;; strchr
;; File description:
;; strchr
;;

section .text
    global strchr

strchr:
    xor rax, rax
    xor rcx, rcx

.loop:
    cmp byte [rdi], 0
    je .not_found
    cmp byte [rdi], sil
    je .found
    inc rdi
    jmp .loop

.not_found:
    ret ;return NULL

.found:
    mov rax, rdi
    ret
