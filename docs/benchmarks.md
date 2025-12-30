# Benchmarks

Ce fichier décrit des méthodes simples pour comparer les performances des fonctions de `AsmMinilibc` avec celles de la libc (glibc).

Outils recommandés
- `time` (intégré)
- `hyperfine` (pour des mesures reproductibles)

Exemples de benchmark

1) Comparaison simple avec `time`

```bash
# construire libasm et l'exécutable de référence
make
gcc -O2 -o bench_glibc bench/bench_memcpy_glibc.c
gcc -O2 -L. -o bench_asm bench/bench_memcpy_asm.c -lasm

LD_LIBRARY_PATH=. time ./bench_asm
time ./bench_glibc
```

2) Utiliser `hyperfine` (plus robuste)

```bash
# installer hyperfine si besoin
sudo apt install -y hyperfine

hyperfine "LD_LIBRARY_PATH=. ./bench_asm" "./bench_glibc"
```

Notes
- Pour des résultats corrects : désactiver le turbo CPU, lancer plusieurs passes, faire attention au cache.
- Documenter la machine (CPU, RAM, kernel) et les options de compilation (`-O2`, `-march`...).
