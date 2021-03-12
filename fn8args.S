.global fn8args
fn8args:
    /*
    arg1 - &argc
    arg2 - argv
    4th and 5th arg of argv is lower, upper bound
    Return the sum of the ASCII values in argv that fall in [lower, upper]
    (Refer to Github explanation)
    */

    xor %rax, %rax
    xor %rdx, %rdx
    xor %rcx, %rcx
    xor %r8, %r8
    xor %r10, %r10

    # Finds the lower
    leaq 24(%rsi), %r15 # r15 used as a temp storage
    movq (%r15), %r15
    movb (%r15), %dl # dl = 4th element; rdx used

    # Finds the upper
    leaq 32(%rsi), %r15
    movq (%r15), %r15
    movb (%r15), %cl # cl = 5th element; rcx used

    movb (%rdi), %r8b # r8b = argc; r8 used

    # Converts from ASCII to int
    subb $48, %cl 
    subb $48, %dl 

    cmpb $1, %dl # if dl < 50 (1 in ASCII)
    jl exit # rax is already 0
    cmpb %r8b, %cl # if 5th >= argc exit
    jge exit
    cmpb %cl, %dl # if 4th > 5th exit
    jg exit

    jmp _loop

_loop:
    cmpb %cl, %dl # if counter <= cl; if counter > cl exit
    jg exit # exits loop

    # Finds address of the next element in the 1D array, 8 is sizeof(pointer)
    leaq (%rsi, %rdx, 8), %r15 # @ to 1D array
    movq (%r15), %r15 # @ to 2D array

    call _loop2

    incb %dl # increments dl (dl is now the counter)
    jmp _loop

_loop2:
    movb (%r15), %r10b # Finds the value at the 2D array
    addq %r10, %rax # Adds value to the return amt

    cmp $0, %r10 # if r10 == NULL exit
    je exit

    addq $1, %r15 # Increments by 1, char is of size 1
    jmp _loop2

exit:
    ret