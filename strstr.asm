;;
;; EPITECH PROJECT, 2025
;; _
;; File description:
;; _
;;

section .text
    global strstr

strstr:
    cmp byte [rsi], 0      ; Check if the search string is empty
    je .found              ; If yes, return the start string

.main_loop:
    cmp byte [rdi], 0      ; Check if the main string is empty
    je .not_found          ; If yes, the string was not found

    mov rbx, rdi           ; Save the current position in the main string
    mov rcx, rsi           ; Save the current position in the search string

.sec_loop:
    mov al, [rbx]          ; Load the current character of the main string
    mov dl, [rcx]          ; Load the current character of the search string
    cmp dl, 0              ; Check if the end of the search string is reached
    je .found              ; If yes, the string was found
    cmp al, dl             ; Compare the current characters of both strings
    jne .next_s1           ; If different, move to the next character of the main string

    inc rbx                ; Increment the main string pointer
    inc rcx                ; Increment the search string pointer
    jmp .sec_loop          ; Continue the comparison loop

.next_s1:
    inc rdi                ; Increment the main string pointer
    jmp .main_loop         ; Resume the main loop

.not_found:
    xor rax, rax           ; Set RAX to 0 to indicate the string was not found
    ret                    ; Return

.found:
    mov rax, rdi           ; Set the address of the found string in RAX
    ret                    ; Return