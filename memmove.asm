;;
;; EPITECH PROJECT, 2025
;; _
;; File description:
;; _
;;

section .text
    global memmove

memmove:
    cmp rdx, 0          ; Check if the size is zero
    je .done            ; If yes, jump to done
    mov rax, rdi        ; Save the destination pointer in rax

    ; Check if the source and destination overlap
    cmp rdi, rsi
    jae .backward_copy  ; If destination >= source, copy backwards

.forward_copy:
    ; Copy forwards
    mov rcx, rdx        ; Set the counter to the size
    rep movsb           ; Use the rep movsb instruction to copy bytes
    jmp .done           ; Jump to done

.backward_copy:
    ; Copy backwards
    lea rsi, [rsi + rdx - 1] ; Point to the end of the source
    lea rdi, [rdi + rdx - 1] ; Point to the end of the destination
    std                 ; Set the direction flag to decrement
    mov rcx, rdx        ; Set the counter to the size
    rep movsb           ; Use the rep movsb instruction to copy bytes
    cld                 ; Clear the direction flag

.done:
    ret                 ; Return