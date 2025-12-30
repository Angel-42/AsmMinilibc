# Design & Conventions

Ce document explique les choix d'implémentation et les conventions suivies pour les fonctions assembleur présentes dans ce dépôt.

## Contexte
- Architecture ciblée : x86_64 (AMD64) sous Linux.
- ABI : System V AMD64 (convention d'appel utilisée par gcc sur Linux x86_64).

## Conventions principales
- Les fonctions respectent l'ABI System V :
  - Registres pour les arguments : `RDI`, `RSI`, `RDX`, `RCX`, `R8`, `R9`.
  - Valeur de retour : `RAX`.
  - Registres préservés : `RBX`, `RBP`, `R12`–`R15` doivent être sauvegardés si modifiés.
  - Registres volatiles : `RAX`, `RCX`, `RDX`, `RSI`, `RDI`, `R8`–`R11` peuvent être modifiés.

## Approche d'implémentation
- Priorité à la clarté pédagogique : code lisible et facilement auditable.
- Copies mémoire alignées par mots (8 octets) quand pertinent pour améliorer les perf.
- `memmove` gère le chevauchement en choisissant la direction de copie adaptée.

## Tests
- Tester chaque fonction avec de petits programmes C (voir `tests/`).

## Optimisations possibles
- Utiliser SSE/AVX pour les copies mémoire intensives.
- Unrolling des boucles et copies par blocs pour réduire overhead.

## Limitations
- Ciblage unique : Linux x86_64. Les adaptations pour d'autres plate-formes demandent réécriture des conventions.
