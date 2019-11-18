#ifndef __STACK_H__
#define __STACK_H__
///
/// Initializes the stack, prepares it for use.
///

void initialize();

/// pushes a value onto the stack
void push( int );

/// returns a pops from the stack
int pop ( void );

/// Returns 1 if full otherwise 0
int isFull ( void );
/// Returns 1 if emplty otherwise 0
int isEmpty (void);

#endif //__STACK_H__