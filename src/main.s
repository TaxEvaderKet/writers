.global _start

msg:    .asciz "Mental asylum here I come\n"

_start:
    callq main

    mov $0x3c, %rax
    xor %rdi, %rdi
    syscall


main:
    pushq %rbp
    movq %rsp, %rbp
    lea msg(%rip), %rdi
    callq print
    
    movq %rbp, %rsp
    popq %rbp
    movq $0x0, %rax
    ret
