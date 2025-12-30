# AsmMinilibc — Minimal C library in x86_64 assembly

Educational and utility project: a collection of NASM (x86_64, System V) implementations of common C standard library functions. Designed for learning system assembly and for integration into small low-level projects.

Important note: this project originates from an Epitech assignment. Before any public reuse or redistribution, please verify rights and the school's policies; the license in this repository may be subject to constraints related to the origin of the files.

Features
- 100% assembly (NASM) implementations of common libc functions.
- Target ABI: System V AMD64 (Linux x86_64).
- Simple `Makefile` to assemble and produce `libasm.so`.

Included functions (examples)
- `strlen` (`strlen.asm`)
- `strchr`, `strrchr`, `strstr`
- `strcmp`, `strncmp`, `strcspn`, `strpbrk`
# AsmMinilibc — Minimal C library in x86_64 assembly

AsmMinilibc is an educational collection of NASM (x86_64, System V) implementations of common C standard library routines. It was created to explore low-level programming and ABI-conformant implementations that can be linked from C programs.

Important note: this project originates from an Epitech assignment. Before any public reuse or redistribution, please verify rights and the school's policies; some files or templates may be subject to the school's guidelines.

Highlights
- 100% NASM implementations of selected libc routines.
- Target: Linux x86_64 (System V AMD64 ABI).
- Minimal `Makefile` to build a shared library (`libasm.so`) and object files.

Implemented examples
- `strlen` (`strlen.asm`)
- `strchr`, `strrchr`, `strstr`
- `strcmp`, `strncmp`, `strcspn`, `strpbrk`
- `memset`, `memcpy`, `memmove`

Repository layout
- `*.asm` — NASM source files (one function per file).
- `Makefile` — build rules to assemble and produce `libasm.so`.
- `docs/` — design notes and benchmarking instructions.
- `tests/` — small C tests and examples.

Build and run (quick)
From the project root:

```bash
make        # assemble and generate libasm.so
make clean  # remove object files
make fclean # remove library and objects
```

If you don't have the toolchain installed (Debian/Ubuntu):

```bash
sudo apt update && sudo apt install -y nasm build-essential
```

Example: compile and run the provided simple test

```bash
gcc -L. -o tests/simple_test tests/simple_test.c -lasm
LD_LIBRARY_PATH=. ./tests/simple_test
```

This will print the length of a test string and verify a basic `memcpy` copy.

C usage (prototypes)

```c
#include <stdio.h>
#include <stddef.h>

size_t strlen(const char *s);
void *memcpy(void *dest, const void *src, size_t n);

int main(void) {
    const char *s = "Hello, AsmMinilibc!";
    printf("len=%zu\n", strlen(s));
    return 0;
}
```

Testing
- See `tests/simple_test.c` for a minimal example. Add more test cases by compiling against `-L.` and linking `-lasm`.

Design & benchmarking
- See `docs/design.md` for design decisions, ABI conventions and implementation notes.
- See `docs/benchmarks.md` for simple benchmarking instructions and examples.

License
- This repository now includes a `LICENSE` file. The current license is MIT — see `LICENSE` for full text.