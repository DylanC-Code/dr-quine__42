; Comment
BITS 64

%define SYS_WRITE     1
%define SYS_EXIT      60
%define STDOUT        1
%define DQUOTE        34
%define NEWLINE       10
%define PERCENT       37

extern printf

section .data
    model db "; Comment%1$cBITS 64%1$c%1$c%3$cdefine SYS_WRITE     1%1$c%3$cdefine SYS_EXIT      60%1$c%3$cdefine STDOUT        1%1$c%3$cdefine DQUOTE        34%1$c%3$cdefine NEWLINE       10%1$c%3$cdefine PERCENT       37%1$c%1$cextern printf%1$c%1$csection .data%1$c    model db %2$c%4$s%2$c%1$c%1$csection .text%1$c    global main%1$c%1$cmain:%1$c    lea rdi, [rel model] ; Another comment%1$c    mov rsi, NEWLINE%1$c    mov rdx, DQUOTE%1$c    mov rcx, PERCENT%1$c    lea r8, [rel model]%1$c    xor rax, rax%1$c    call printf%1$c%1$c    mov eax, 0%1$c    ret%1$c"

section .text
    global main

main:
    lea rdi, [rel model] ; Another comment
    mov rsi, NEWLINE
    mov rdx, DQUOTE
    mov rcx, PERCENT
    lea r8, [rel model]
    xor rax, rax
    call printf

    mov eax, 0
    ret
