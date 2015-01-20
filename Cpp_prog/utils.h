#ifndef UTILS_H
#define UTILS_H

#include <stdlib.h>
#include <math.h>
#include <sstream>
#include <string>
#include <iostream>
#include <vector>

using namespace std;

double RandFloat(){
    return (rand())/(RAND_MAX+1.0);    
}

//returns a random float in the range -1 < n < 1
double RandomClamped(){
  return RandFloat() - RandFloat();
}
#endif
