format ELF64 executable

macro exit code
{
    mov rax, 60
    mov rdi, code
    syscall
}

macro write fd, buf, buflen
{
    mov rax, 1
    mov rdi, fd
    mov rsi, buf
    mov rdx, buflen
    syscall
}

segment readable executable
entry main
main:

    write 1, msg, msg_len
    exit 0

segment readable writeable
msg db "Hello, World!", 10
msg_len = $ - msg
