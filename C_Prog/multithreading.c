#include <pthread.h>
#include <stdio.h>

/* this function is run by the second thread */
void *inc_x(void *x_void_ptr)
{

  while(1){
    
  }

}

void *inc_y(void *x_void_ptr)
{

  while(1){
  
  }

}

void *inc_z(void *x_void_ptr)
{

  while(1){
  
  }

}

int main()
{


/* this variable is our reference to the second thread */
  pthread_t inc_x_thread;

/* create a second thread which executes inc_x(&x) */
  pthread_create(&inc_x_thread, NULL, inc_x,NULL); 

  pthread_create(&inc_x_thread, NULL, inc_y,NULL);   
  
  pthread_create(&inc_x_thread, NULL, inc_z,NULL);  
  while(1){
  
  }
  
  return 0;

}
