.global assem
assem:
    /*
    arg1 - &argc
    arg2 - argv
    Return the sum of the ASCII values in argv
    */

    # Zeroes out the registers that will be used
    xor %rax, %rax
    xor %rdx, %rdx
    xor %rcx, %rcx
    xor %r10, %r10
    xor %r15, %r15

    movb (%rdi), %cl # cl = argc; rcx reg
    movb $1, %dl # dl = index; rdx reg

    jmp firstD

firstD: # Loops thru "1st dimension"
    cmpb %cl, %dl # If index < argc; if index >= argc exit
    jge exit # Exits loop

    # Finds address of the next element in the 1D array, 8 is sizeof(pointer)
    leaq (%rsi, %rdx, 8), %r15 # @ to 1D array
    movq (%r15), %r15 # @ to 2D array

    call secondD

    incb %dl # increments dl (dl is now the counter)
    jmp firstD

secondD: # Loops thru "2nd dimension"
    movb (%r15), %r10b # Finds the value at the 2D array
    addq %r10, %rax # Adds value to the return amt

    cmp $0, %r10 # If r10 == NULL exit
    je exit

    addq $1, %r15 # Increments by 1, char is of size 1
    jmp secondD

exit:
    ret
