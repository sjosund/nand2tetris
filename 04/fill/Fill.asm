@8192 // Set screen size, Check real value later
D=A
@screen_size
M=D
(MAINLOOP)
    @KBD
    D=M
    @WHITE
    D;JEQ // If not pressing any button, make screen white
    @BLACK
    0;JEQ  // If pressing, make screen black

// Set the white fill value
(WHITE)
    @value
    M=0
    @PREFILL
    0;JEQ

// Set the black fill value
(BLACK)
    @value
    M=-1
    @PREFILL
    0;JEQ

// Reset screen index counter
(PREFILL)
    @i
    M=0

(FILL)
    @i // Check if we reached the end of the screen.
    D=M
    @screen_size
    D=M-D
    @MAINLOOP
    D;JEQ

    // Fill screen with value
    @i
    D=M
    @SCREEN
    D=A+D // Address to fill
    @fill_address
    M=D

    @value
    D=M
    @fill_address
    A=M
    M=D

    @i
    M=M+1
    @FILL
    0;JEQ

