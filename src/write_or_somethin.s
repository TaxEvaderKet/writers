.global my_strlen
.global write
.global print

my_strlen:
    push %rbp
    mov %rsp, %rbp
    mov %rdi, %rsi
    xor %rax, %rax

1:
    cmpb $0, (%rsi)
    je 2f
    inc %rsi
    inc %rax
    jmp 1b

2:
    pop %rbp
    ret

write: 
    movq $1, %rax
    syscall
    ret

print:
    pushq %rbp
    movq %rsp, %rbp

    movq %rdi, %rsi
    callq my_strlen

    movq %rdi, %rsi
    movq $1, %rdi 
    movq %rax, %rdx
    callq write

    movq %rbp, %rsp
    popq %rbp
    ret
