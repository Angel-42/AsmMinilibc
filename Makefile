##
## EPITECH PROJECT, 2025
## libasm
## File description:
## Makefile
##

NAME = libasm.so

ASM = nasm
LD = ld
ASMFLAGS = -f elf64
LDFLAGS = -shared
SRC = 	strlen.asm \
		strchr.asm \
		strrchr.asm \
		memset.asm \
		memcpy.asm \
		memmove.asm \
		strcmp.asm \
		strncmp.asm \
		strstr.asm \
		strcspn.asm \
		strpbrk.asm
OBJ = $(SRC:.asm=.o)

all: $(NAME)

$(NAME): $(OBJ)
	$(LD) $(LDFLAGS) -o $@ $^

%.o: %.asm
	$(ASM) $(ASMFLAGS) -o $@ $<

clean:
	rm -f $(OBJ)

fclean: clean
	rm -f $(NAME)

re: fclean all
