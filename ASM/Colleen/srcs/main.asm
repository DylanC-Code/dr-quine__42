BITS 64

%define SYS_WRITE     1
%define SYS_EXIT      60
%define STDOUT        1
%define DQUOTE        34


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
    header db "BITS 64", 10, 10, "%define SYS_WRITE     1", 10, "%define SYS_EXIT      60", 10, "%define STDOUT        1", 10, "%define DQUOTE        34", 10, 10, 10
    header_write db "%macro WRITE 2", 10, "    mov rax, SYS_WRITE", 10 "    mov rdi, STDOUT", 10, "    mov rsi, %1", 10, "    mov rdx, %2", 10, "    syscall", 10, "%endmacro", 10, 10
    header_exit db "%macro EXIT 0", 10, "    mov rax, SYS_EXIT", 10 "    xor rdi, rdi", 10, "    syscall", 10, "%endmacro", 10, 10, 10
    header_len equ $ - header

    data_section db "section .data", 10
    data_section1 db "    header db ",DQUOTE,"BITS 64",DQUOTE,", 10, 10, ",DQUOTE,"%define SYS_WRITE     1",DQUOTE,", 10, ",DQUOTE,"%define SYS_EXIT      60",DQUOTE,", 10, ",DQUOTE,"%define STDOUT        1",DQUOTE,", 10, ",DQUOTE,"%define DQUOTE        34",DQUOTE,", 10, 10, 10", 10
    data_section2 db "    header_write db ",DQUOTE,"%macro WRITE 2",DQUOTE,", 10, ",DQUOTE,"    mov rax, SYS_WRITE",DQUOTE,", 10 ",DQUOTE,"    mov rdi, STDOUT",DQUOTE,", 10, ",DQUOTE,"    mov rsi, %1",DQUOTE,", 10, ",DQUOTE,"    mov rdx, %2",DQUOTE,", 10, ",DQUOTE,"    syscall",DQUOTE,", 10, ",DQUOTE,"%endmacro",DQUOTE,", 10, 10", 10
    data_section3 db "    header_exit db ",DQUOTE,"%macro EXIT 0",DQUOTE,", 10, ",DQUOTE,"    mov rax, SYS_EXIT",DQUOTE,", 10 ",DQUOTE,"    xor rdi, rdi",DQUOTE,", 10, ",DQUOTE,"    syscall",DQUOTE,", 10, ",DQUOTE,"%endmacro",DQUOTE,", 10, 10, 10", 10
    data_section4 db "    header_len equ $ - header", 10, 10

    data_section10 db "    text_section db ", DQUOTE, "section .text", DQUOTE, ", 10, ", DQUOTE, "    global _start", DQUOTE, ", 10, 10, 10", 10
    data_section11 db "    text_section_len equ $ - text_section", 10, 10
    data_section12 db "    code db ",DQUOTE,"_start:",DQUOTE,", 10, ",DQUOTE,"    WRITE header, header_len",DQUOTE,", 10, ",DQUOTE,"    WRITE data_section, data_section_len",DQUOTE,", 10, ",DQUOTE,"    WRITE text_section, text_section_len",DQUOTE,", 10, ",DQUOTE,"    WRITE code, code_len",DQUOTE,", 10, 10, ",DQUOTE,"    EXIT",DQUOTE,", 10", 10
    data_section13 db "    code_len equ $ - code", 10, 10
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
