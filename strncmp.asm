;;
;; EPITECH PROJECT, 2025
;; _
;; File description:
;; _
;;

section .text
    global strncmp

strncmp:
    test rdx, rdx
    je .equal

.loop:
    mov al, [rdi]
    mov bl, [rsi]
    cmp al, bl
    jne .diff

    test al, al
    je .equal

    dec rdx
    jz .equal

    inc rdi
    inc rsi
    jmp .loop

.diff:
    movzx eax, al
    movzx ebx, bl
    sub eax, ebx
    ret

.equal:
    xor eax, eax
    ret