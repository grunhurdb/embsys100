    PUBLIC swapCharAsm  // Exports symbols to other modules
                    // Making sqrAsm available to other modules.

    SECTION .text:CODE:REORDER:NOROOT(2)
    
    THUMB

swapCharAsm
    MOVS R2, R0

    LDRB R0, [R2]  //Load Register R0 with value at adress R2
    LDRB R3, [R1]  //Load Register R3 with value at adress R1

    CMP R0, R3     //Compare R0 and R3
    BEQ returnZero //Jump to returnZero if compare was ==
    STRB R0, [R1]  //Store R0 at address contained in R1
    STRB R3, [R2]  //Store R3 at address contained in R2
    MOVS R0, #1    // Move 1 to R0 
    Bx LR          // Return with results in R0
    
returnZero
    MOVS R0 , #0   // MOVE 0 to R0
    Bx LR          // Return with results in R0
    END
