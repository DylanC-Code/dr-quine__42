; One Comment
BITS 64

%define PERCENT 37
%define NEWLINE 10
%define DQUOTE  34

section .data
    format          db 10, 10, "=== %s ===", 10,  10, 0
    source_name     db __FILE__, 0
    output_source   db "Sully_X.asm", 0
    executable      db "Sully_X", 0
    initial_source  db "Sully.asm", 0
    COMPILE_CMD     db "/usr/bin/nasm -felf64 Sully_%1$c.asm && /usr/bin/ld Sully_%1$c.o -o Sully_%1$c -lc --dynamic-linker /lib/x86_64-linux-gnu/ld-linux-x86-64.so.2 && /usr/bin/rm Sully_%1$c.o", 0
    RUN_CMD         db "./Sully_%1$c", 0
    model           db "; One Comment%1$cBITS 64%1$c%1$c%5$cdefine PERCENT 37%1$c%5$cdefine NEWLINE 10%1$c%5$cdefine DQUOTE  34%1$c%1$csection .data%1$c    format          db 10, 10, %2$c=== %5$cs ===%2$c, 10,  10, 0%1$c    source_name     db __FILE__, 0%1$c    output_source   db %2$cSully_X.asm%2$c, 0%1$c    executable      db %2$cSully_X%2$c, 0%1$c    initial_source  db %2$cSully.asm%2$c, 0%1$c    COMPILE_CMD     db %2$c/usr/bin/nasm -felf64 Sully_%5$c1$c.asm && /usr/bin/ld Sully_%5$c1$c.o -o Sully_%5$c1$c -lc --dynamic-linker /lib/x86_64-linux-gnu/ld-linux-x86-64.so.2 && /usr/bin/rm Sully_%5$c1$c.o%2$c, 0%1$c    RUN_CMD         db %2$c./Sully_%5$c1$c%2$c, 0%1$c    model           db %2$c%3$s%2$c, 0%1$c    mode_w          db %2$cw%2$c, 0%1$c    i               db %4$c%1$c%1$csection .bss%1$c    COMPILE_CMD_BUFFER resb 1000%1$c    RUN_CMD_BUFFER     resb 100%1$c%1$c%1$csection .text%1$c    extern printf%1$c    extern fopen%1$c    extern fclose%1$c    extern fprintf%1$c    extern system%1$c    extern strstr%1$c    extern sprintf%1$c%1$cglobal _start%1$c_start:%1$c    ; Vérifie si __FILE__ contient %2$cSully.asm%2$c%1$c    lea rdi, [rel source_name]      ; haystack%1$c    lea rsi, [rel initial_source]   ; needle%1$c    call strstr%1$c    cmp rax, 0%1$c    jz  .not_init%1$c    jmp .check_zero%1$c%1$c    .not_init:%1$c        movzx rax, byte [rel i]%1$c        dec rax%1$c        mov [rel i], al                 ; i--%1$c%1$c    .check_zero:%1$c        movzx rax, byte [rel i]%1$c        cmp al, 0%1$c        jl .exit_process%1$c%1$c    .updating_output_source_and_executable:%1$c        mov al, [rel i]%1$c        add al, '0'                     ; convertit i → ASCII%1$c        mov byte [rel output_source + 6], al%1$c        mov byte [rel executable + 6], al%1$c%1$c    jmp open_file%1$c%1$c    .exit_process:%1$c        mov rax, 60                     ; syscall exit%1$c        xor rdi, rdi%1$c        syscall%1$c%1$copen_file:%1$c    lea rdi, [rel output_source]%1$c    lea rsi, [rel mode_w]%1$c    call fopen%1$c    cmp rax, 0%1$c    mov rbx, rax%1$c    jg write_in_file%1$c    jmp .open_file_error%1$c%1$c    .open_file_error:%1$c        mov rax, 60                     ; syscall exit%1$c        mov rdi, 1%1$c        syscall%1$c%1$c%1$c%1$cwrite_in_file:%1$c    mov rdi, rbx%1$c    lea rsi, [rel model]%1$c    mov rdx, NEWLINE%1$c    mov rcx, DQUOTE%1$c    lea r8, [rel model]%1$c    movzx r9, byte [rel i]%1$c    add r9, '0'%1$c    mov rax, PERCENT%1$c    push rax%1$c    xor rax, rax%1$c    call fprintf%1$c    add rsp, 8%1$c%1$c    mov rdi, rbx%1$c    call fclose%1$c%1$c    %1$c%1$ccompile_file:%1$c    lea rdi, [rel COMPILE_CMD_BUFFER]   ; buffer de sortie%1$c    lea rsi, [rel COMPILE_CMD]      ; format string%1$c    movzx rdx, byte [rel i]         ; paramètre %5$c1$c%1$c    add rdx, '0'                    ; convertir en ASCII%1$c    xor rax, rax%1$c    call sprintf%1$c%1$c    lea rdi, [rel COMPILE_CMD_BUFFER]%1$c    call system%1$c%1$crun_file:%1$c    lea rdi, [rel RUN_CMD_BUFFER]   ; buffer de sortie%1$c    lea rsi, [rel RUN_CMD]       ; format string%1$c    movzx rdx, byte [rel i]         ; paramètre %5$c1$c%1$c    add rdx, '0'                    ; convertir en ASCII%1$c    xor rax, rax%1$c    call sprintf%1$c%1$c    lea rdi, [rel RUN_CMD_BUFFER]%1$c    call system%1$c%1$cexit_process:%1$c    mov rax, 60                     ; syscall exit%1$c    mov rdi, 72%1$c    syscall%1$c%1$c%1$c", 0
    mode_w          db "w", 0
    i               db 5

section .bss
    COMPILE_CMD_BUFFER resb 1000
    RUN_CMD_BUFFER     resb 100


section .text
    extern printf
    extern fopen
    extern fclose
    extern fprintf
    extern system
    extern strstr
    extern sprintf

global _start
_start:
    ; Vérifie si __FILE__ contient "Sully.asm"
    lea rdi, [rel source_name]      ; haystack
    lea rsi, [rel initial_source]   ; needle
    call strstr
    cmp rax, 0
    jz  .not_init
    jmp .check_zero

    .not_init:
        movzx rax, byte [rel i]
        dec rax
        mov [rel i], al                 ; i--

    .check_zero:
        movzx rax, byte [rel i]
        cmp al, 0
        jl .exit_process

    .updating_output_source_and_executable:
        mov al, [rel i]
        add al, '0'                     ; convertit i → ASCII
        mov byte [rel output_source + 6], al
        mov byte [rel executable + 6], al

    jmp open_file

    .exit_process:
        mov rax, 60                     ; syscall exit
        xor rdi, rdi
        syscall

open_file:
    lea rdi, [rel output_source]
    lea rsi, [rel mode_w]
    call fopen
    cmp rax, 0
    mov rbx, rax
    jg write_in_file
    jmp .open_file_error

    .open_file_error:
        mov rax, 60                     ; syscall exit
        mov rdi, 1
        syscall



write_in_file:
    mov rdi, rbx
    lea rsi, [rel model]
    mov rdx, NEWLINE
    mov rcx, DQUOTE
    lea r8, [rel model]
    movzx r9, byte [rel i]
    add r9, '0'
    mov rax, PERCENT
    push rax
    xor rax, rax
    call fprintf
    add rsp, 8

    mov rdi, rbx
    call fclose

    

compile_file:
    lea rdi, [rel COMPILE_CMD_BUFFER]   ; buffer de sortie
    lea rsi, [rel COMPILE_CMD]      ; format string
    movzx rdx, byte [rel i]         ; paramètre %1$c
    add rdx, '0'                    ; convertir en ASCII
    xor rax, rax
    call sprintf

    lea rdi, [rel COMPILE_CMD_BUFFER]
    call system

run_file:
    lea rdi, [rel RUN_CMD_BUFFER]   ; buffer de sortie
    lea rsi, [rel RUN_CMD]       ; format string
    movzx rdx, byte [rel i]         ; paramètre %1$c
    add rdx, '0'                    ; convertir en ASCII
    xor rax, rax
    call sprintf

    lea rdi, [rel RUN_CMD_BUFFER]
    call system

exit_process:
    mov rax, 60                     ; syscall exit
    mov rdi, 72
    syscall


