/*******************************************************************************
File name       : user_led.s
Description     : Assembly language function for controlling the user LED
*******************************************************************************/   

    EXTERN delay  // delay() is defined outside this file.

    PUBLIC control_user_led         // Exports symbols to other modules

// Code is split into logical sections using the SECTION directive.
// Source: http://ftp.iar.se/WWWfiles/arm/webic/doc/EWARM_AssemblerReference.ENU.pdf
// SECTION  section  :type [:flag] [(align)]
//      The data section is used for declaring initialized data or constants. This data does not change at runtime
//      The bss section is used for declaring variables. The syntax for declaring bss section is -
//      The text section is used for keeping the actual code.

// CODE: Interprets subsequent instructions as Arm or Thumb instructions, 
// depending on the setting of related assembler options.

// NOREORDER (the default mode) starts a new fragment in the section
// with the given name, or a new section if no such section exists.
// REORDER starts a new section with the given name.

// NOROOT means that the section fragment is discarded by the linker if
// no symbols in this section fragment are referred to. Normally, all
// section fragments except startup code and interrupt vectors should
// set this flag.

// The (2) is for the (align)
// The power of two to which the address should be aligned.
// The permitted range is 0 to 8. 
// Code aligned at 4 Bytes.

    SECTION .text:CODE:REORDER:NOROOT(2)
    
    THUMB               // Indicates THUMB code is used
                        // Subsequent instructions are assembled as THUMB instructions
    
/*******************************************************************************
Function Name   : control_user_led
Description     : - Uses Peripheral registers at base 0x4000.0000
                    to set GPIOA Output Data Register.
                  - Calls another assembly function delay to insert
                    delay loop

C Prototype     : void control_user_led(uint8_t state, uint32_t duration)
                : Where state indicates if LED should be on or off.
Parameters      : R0: uint8_t state
                : R1: uint32_t duration
Return value    : None
*******************************************************************************/  

control_user_led
    PUSH {R3-R5 , LR } //Save State
    
    MOVS R4,R0  // MOV R0 to R4
    MOVS R5,R1  // MOV R1 to R5
    MOVS R0,R4  // MOV R4 to R0
    CMP R0,#1   // Compare R0 with 1
    BNE.N DO_OFF /// If R0 != 1 goto DO_OFF
DO_ON            //LABEL
    LDR.N R0, =0x4002'0014  //load from address (compiler convers to PC, #x format)
    LDR R1, [R0] //load into R1 the contentes of address at R0
    ORRS.W R1, R1, #32  //Logical OR R1 with #32
    STR R1, [R0] //Store R0 into the address pointer to by R1
    B.N DO_DELAY  //Call Delay function
DO_OFF
    LDR.N R0 , =0x4002'0014 //load from address (compiler convers to PC, #x format)
    LDR R1 , [R0] //load into R1 the contentes of address at R0
    BICS.W R1 , R1, #32  //Bitwise bit clear R1 with #32
    STR R1, [R0] //Store R0 into the address pointer to by R1
DO_DELAY // LABEL
    MOVS R0, R5 //MOVES the delay function argument back to R0 for Delay function
    BL delay  //Calls delay
    
    POP {R0,R4,R5, LR}        // Restore Risgters and LR
    BX LR           // Return

    END
