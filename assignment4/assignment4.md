1. a) See code in 1a_code
   b) ![Image of Bit Alias Assembny](
https://raw.githubusercontent.com/grunhurdb/embsys100/master/assignment4/Bit_Alias.JPG)

   c) ![Image of Bit Alias Assembny](https://raw.githubusercontent.com/grunhurdb/embsys100/master/assignment4/not_bit_alias.JPG)
   
	
2. a. For the first 4 arguments the value is loaded directly into the registers R0-R3 for any additional arguments the complier stores the value into the location of the stack pointer plus offset of additional. 

   b. STR R0, [SP]
   
   c. PUSH{R4} & LDR R4, [SP, #0x8]
   
   d. When the code operated on R4 the compiler directly after pushed the result back to the stack to store the value.  It also pop's r4 back after the function is complete

3. See Stack folder