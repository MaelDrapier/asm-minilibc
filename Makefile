##
## EPITECH PROJECT, 2018
## asm minilibc
## File description:
## Makefile for asm minlibc
##

ASM	=	nasm

CC	=	gcc

RM	=	rm -f

ASFLAGS	=	-f elf64

NAME	=	libasm.so

T_NAME	=	lib_test

SRCS	=	src/strlen.asm		\
		src/strchr.asm		\
		src/rindex.asm		\
		src/memset.asm		\
		src/memcpy.asm		\
		src/memmove.asm		\
		src/strcmp.asm		\
		src/strncmp.asm		\
		src/strcasecmp.asm	\
		src/strcspn.asm		\
		src/strpbrk.asm		\
		src/strstr.asm

T_SRCS	=	src/lib_tests.c

OBJS	=	$(SRCS:.asm=.o)

T_OBJS	=	$(T_SRCS:.c=.o)


all:		$(NAME)

$(NAME):	$(OBJS)
		$(CC) -nostdlib -shared -fPIC $(OBJS) -o $(NAME)

lib_test:	$(T_OBJS)
		$(CC) $(T_OBJS) -o $(T_NAME)

%.o : %.asm
		$(ASM) $(ASFLAGS) -o $@ $<

clean:
		$(RM) $(OBJS) $(T_OBJS)

fclean:		clean
		$(RM) $(NAME) $(T_NAME)

re:		fclean all

.PHONY:		all clean fclean re
