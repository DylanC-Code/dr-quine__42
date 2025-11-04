; One Comment
BITS 64

section .data
    model db "; One Comment%1$cBITS 64%1$c%1$csection .data%1$c    model db %2$c%3$s%2$c, 0%1$c    filename db %2$cGrace_kid.asm%2$c, 0%1$c    mode_w db %2$cw%2$c, 0%1$c%1$c%1$csection .text%1$c    extern fopen%1$c    extern fclose%1$c    extern fprintf%1$c%1$c%4$cmacro FT 0%1$cglobal _start%1$c_start:%1$c    open_file:%1$c        lea rdi, [rel filename]%1$c        lea rsi, [rel mode_w]%1$c        call fopen%1$c%1$c        test rax, rax%1$c        jz .open_failed%1$c        mov rbx, rax%1$c        jmp write_in_file%1$c    %1$c    .open_failed:%1$c        mov rax, 60%1$c        mov rdi, 1%1$c        syscall%1$c%1$c    write_in_file:%1$c        mov rdi, rbx%1$c        lea rsi, [rel model]%1$c        mov rdx, 10%1$c        mov rcx, 34%1$c        lea r8, [rel model]%1$c        mov r9, 37%1$c        xor rax, rax%1$c        call fprintf%1$c%1$c    close_file:%1$c        mov rdi, rbx%1$c        call fclose%1$c    %1$c    exit_process:%1$c        mov rax, 60%1$c        xor rdi, rdi%1$c        syscall%1$c%4$cendmacro%1$c%1$cFT%1$c", 0
    filename db "Grace_kid.asm", 0
    mode_w db "w", 0


section .text
    extern fopen
    extern fclose
    extern fprintf

%macro FT 0
global _start
_start:
    open_file:
        lea rdi, [rel filename]
        lea rsi, [rel mode_w]
        call fopen

        test rax, rax
        jz .open_failed
        mov rbx, rax
        jmp write_in_file
    
    .open_failed:
        mov rax, 60
        mov rdi, 1
        syscall

    write_in_file:
        mov rdi, rbx
        lea rsi, [rel model]
        mov rdx, 10
        mov rcx, 34
        lea r8, [rel model]
        mov r9, 37
        xor rax, rax
        call fprintf

    close_file:
        mov rdi, rbx
        call fclose
    
    exit_process:
        mov rax, 60
        xor rdi, rdi
        syscall
%endmacro

FT
