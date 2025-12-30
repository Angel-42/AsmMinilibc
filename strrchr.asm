;;
;; EPITECH PROJECT, 2025
;; strrchr
;; File description:
;; strrchr
;;

section .text
    global strrchr

strrchr:
    xor rax, rax
    mov rdx, rdi

.find_end:
    cmp byte [rdx], 0
    je .start_reverse
    inc rdx
    jmp .find_end

.start_reverse:
    dec rdx

.reverse_loop:
    cmp byte [rdx], sil
    je .found
    cmp byte [rdx], 0
    je .done
    dec rdx
    jmp .reverse_loop

.found:
    mov rax, rdx
    ret

.done:
    ret