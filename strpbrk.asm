;;
;; EPITECH PROJECT, 2025
;; _
;; File description:
;; _
;;

section .text
    global strpbrk

strpbrk:

.loop:
    mov al, [rdi]
    test al, al
    je .not_found    
    mov rdx, rsi

.check_accept:
    mov bl, [rdx]
    test bl, bl
    je .continue

    cmp al, bl
    je .found

    inc rdx
    jmp .check_accept

.continue:
    inc rdi
    jmp .loop

.not_found:
    xor rax, rax
    ret

.found:
    mov rax, rdi
    ret
