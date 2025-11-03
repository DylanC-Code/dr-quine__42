BITS 64

%define SYS_WRITE     1
%define SYS_EXIT      60
%define STDOUT        1


%macro WRITE 2
    mov rax, SYS_WRITE
    mov rdi, STDOUT
    mov rsi, %1
    mov rdx, %2
    syscall
%endmacro

%macro EXIT 0
    mov rax, SYS_EXIT
    xor rdi, rdi
    syscall
%endmacro


section .data
    header db "BITS 64", 10, 10, "%define SYS_WRITE     1", 10, "%define SYS_EXIT      60", 10, "%define STDOUT        1", 10, 10, 10
    header_write db "%macro WRITE 2", 10, "    mov rax, SYS_WRITE", 10 "    mov rdi, STDOUT", 10, "    mov rsi, %1", 10, "    mov rdx, %2", 10, "    syscall", 10, "%endmacro", 10, 10
    header_exit db "%macro EXIT 0", 10, "    mov rax, SYS_EXIT", 10 "    xor rdi, rdi", 10, "    syscall", 10, "%endmacro", 10, 10, 10
    header_len equ $ - header

    data_section db "section .data", 10, "...", 10, 10
    data_section_len equ $ - data_section

    text_section db "section .text", 10, "    global _start", 10, 10, 10
    text_section_len equ $ - text_section

    code db "_start:", 10, "    WRITE header, header_len", 10, "    WRITE data_section, data_section_len", 10, "    WRITE text_section, text_section_len", 10, "    WRITE code, code_len", 10, 10, "    EXIT", 10
    code_len equ $ - code

section .text
    global _start


_start:
    WRITE header, header_len
    WRITE data_section, data_section_len
    WRITE text_section, text_section_len
    WRITE code, code_len

    EXIT
