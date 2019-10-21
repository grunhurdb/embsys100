1a. R1       -> 0x80000000
 b. localVar -> -2147483648
 c.  APSR/N  -> 1  This is set because the MSB is set 
 c.  APSR/V  -> 1  This is set because the MSB is set to 1, and so if the register represents a signed variable the operation that happened wouldn't fit in the 2's complement representation 
 
2a. localVar -> 0
 b. APSR/N   -> 0  MSB is 0
 b. APSR/V   -> 0  MSB is not set, the localVar if signed would fit in a 2's complement
 
3a. localVar -> 2147483648
 b.  APSR/N  -> 1  This is set because the MSB is set 
 b.  APSR/V  -> 1  This is set because the MSB is set to 1, and so if the register represents a signed variable the operation that happened wouldn't fit in the 2's complement representation 
 
4a. localVar -> 0
 b.  APSR/N  -> 0  MSB is 0
 b.  APSR/V  -> 0  MSB is not set, the localVar if signed would fit in a 2's complement
 
 
5a. The counter variable is global
 b. The variable is no longer visable in the local window
 c. The variable can be found in the auto window and watch if typed in.
 d. 0x20000000
 
6a. 4
 b. The counter increments both on the ++(*p_int) and the counter++ because p_int points to the address of the global variable counter.
 
7.a counter is stored at 0x20000000
  b The value is stored in RAM because it changes.
  c 4
  

 



	