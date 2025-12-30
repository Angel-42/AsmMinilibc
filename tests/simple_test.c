#include <stdio.h>
#include <stddef.h>

size_t strlen(const char *s);
void *memcpy(void *dest, const void *src, size_t n);

int main(void) {
    const char src[] = "Hello, AsmMinilibc!";
    char buf[64];
    size_t l = strlen(src);
    printf("strlen(src) = %zu\n", l);
    memcpy(buf, src, l + 1);
    printf("copied -> %s\n", buf);
    return 0;
}
