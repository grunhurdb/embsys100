#include "stack.h"
#include <assert.h>

void test01(void);
void test02(void);
void test03(void); 


int main()
{
 
  test01();
  test02();
  test03();

  
}

void test01( void )
{
   initialize();  
   assert ( 1 == isEmpty() );
    
}

void test02 ( void )
{
  initialize();
  int value;
  
  push( 5) ;
  value = pop();
  
  assert ( 5 == value);
  assert ( 1 == isEmpty() );
  assert ( 0 == isFull());
  
}

void test03( void )
{
  int value=0;
  
  initialize();
  
  
  
  for (int i = 1 ; i < 20 ; i++)
  {
    push(i);
  }
  
  assert ( 1 == isFull());
  for ( int i = 10 ; i >= 1 ; i--)
  {
    value = pop();
    assert ( i == value);
  }
  assert ( 1 == isEmpty() ); 
  
}
  