#include "stack.h"


#define max_size 10

int Stack[max_size];

int pointer = 0;
int size = 0;

///
/// Initializes the stack, prepares it for use.
///

void initialize()
{
    pointer = 0;
    size = 0;   
}
/// pushes a value onto the stack
void push( int value )
{
  if ( isFull() )
    return;
  
  Stack[pointer] = value;
  
  pointer++;
  size++;

}
/// returns a pops from the stack
int pop ( void )
{
   if ( isEmpty() )
     return 0;
   
   int toReturn = Stack[pointer-1];
  
   pointer--;
   size--;
     
   return toReturn;
}
/// Returns 1 if full otherwise 0
int isFull ( void )
{
    if ( max_size <= size )
       return 1;
    return 0;
}
/// Returns 1 if emplty otherwise 0
int isEmpty (void)
{
    if ( 0 == size )
       return 1;
    return 0;  
}