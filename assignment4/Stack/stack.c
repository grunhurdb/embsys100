#include "stack.h"


#define max_size 10

int Stack[max_size];

int nextIn = 0;
int nextOut = 0;
int size = 0;

///
/// Initializes the stack, prepares it for use.
///

void initialize()
{
    nextIn = 0;
    nextOut = 0;
    size = 0;   
}
/// pushes a value onto the stack
void push( int value )
{
  if ( isFull() )
    return;
  
  Stack[nextIn] = value;
  
  if ((max_size-1) == nextIn)
    nextIn=0;
  else
    nextIn++;
  
  size++;

}
/// returns a pops from the stack
int pop ( void )
{
   if ( isEmpty() )
     return 0;
   
   int toReturn = Stack[nextOut];
  
   if ((max_size-1) == nextOut)
    nextOut=0;
   else
    nextOut++;
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