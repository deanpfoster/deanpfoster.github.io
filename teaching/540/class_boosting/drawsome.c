/* Some basic functions to do the quality control ideas */

#include <stdlib.h>
#include <math.h>

drawsome (howmany,probs,numcats,result)
double *probs;
long *numcats,*result,*howmany;
{
int cats = *numcats;
int i,j,val;
double myrand,counter;
double newprobs[cats];

for(i = 0; i < cats ; i++){ newprobs[i] = *probs++;}


for(j = 0; j < *howmany; j++){

counter = newprobs[0];
val = 0;
myrand = drand48();

while (counter < myrand){
val++; 
counter += newprobs[val];
}
*result++ = val;
}


}

