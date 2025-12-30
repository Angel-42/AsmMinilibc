;;
;; EPITECH PROJECT, 2025
;; __
;; File description:
;; _
;;

section .text
    global strcspn

strcspn:
    xor rcx, rcx

.loop:
    mov al, [rdi + rcx]
    test al, al
    je .done
    mov rdx, rsi

.check_reject:
    mov bl, [rdx]
    test bl, bl
    je .continue

    cmp al, bl
    je .done

    inc rdx
    jmp .check_reject

.continue:
    inc rcx
    jmp .loop

.done:
    mov rax, rcx
    ret
