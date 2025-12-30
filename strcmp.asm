;;
;; EPITECH PROJECT, 2025
;; strcmp
;; File description:
;; strcmp
;;

section .text
    global strcmp

strcmp:
    test rdi, rdi        ; Vérifier si la première chaîne est nulle
    je .equal            ; Si oui, les chaînes sont égales

.loop:
    mov al, [rdi]        ; Charger le caractère actuel de la première chaîne
    mov bl, [rsi]        ; Charger le caractère actuel de la deuxième chaîne
    cmp al, bl           ; Comparer les caractères actuels
    jne .diff            ; Si différents, aller à .diff

    test al, al          ; Vérifier si la fin de la chaîne est atteinte
    je .equal            ; Si oui, les chaînes sont égales

    inc rdi              ; Incrémenter le pointeur de la première chaîne
    inc rsi              ; Incrémenter le pointeur de la deuxième chaîne
    jmp .loop            ; Recommencer la boucle

.diff:
    movzx eax, al        ; Étendre le caractère de la première chaîne à 32 bits
    movzx ebx, bl        ; Étendre le caractère de la deuxième chaîne à 32 bits
    sub eax, ebx         ; Soustraire les caractères
    ret                  ; Retourner le résultat

.equal:
    xor eax, eax         ; Mettre eax à zéro (les chaînes sont égales)
    ret                  ; Retourner