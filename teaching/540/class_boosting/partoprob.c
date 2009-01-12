/* Some basic functions to do the quality control ideas */

#include <stdlib.h>
#include <math.h>

partoprob (params, numcats, family,result)
double *params;
long *numcats;
long *family;
double *result;
{

int cats = *numcats;


double etai[cats];
double sumeta = 1.;
double probs[cats];

int i;

etai[0] = 0.;
for(i = 1; i < cats; i++){
  if(*family  ==1){
    etai[i] = -*params * lgamma((double)(i+1)) + *(params+1) * (double) i;}
  if(*family == 2){
    etai[i] = *params * (lgamma((double)(cats)) - 
                         lgamma((double)(i+1))   -
                         lgamma((double)(cats-i)) ) + 
                         *(params+1) * (double) i;}
sumeta += exp(etai[i]);
}

for(i = 0; i < cats; i++){
probs[i] = exp(etai[i])/sumeta;
*(result+i) = probs[i];
}

}
