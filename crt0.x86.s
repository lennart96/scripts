global _start
extern main

BITS 32

_start:
    call main
    mov ebx, eax
    mov eax, 1
    int 0x80
