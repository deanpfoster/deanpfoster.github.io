/* keycalc.f -- translated by f2c (version 19970219).
   You must link the resulting object file with the libraries:
	-lf2c -lm   (in that order)
*/

#include "f2c.h"

/* Common Block Declarations */

struct {
    doublereal a[24]	/* was [6][4] */, b[30]	/* was [6][5] */, c__[36]	
	    /* was [6][6] */;
} xmat_;

#define xmat_1 xmat_

struct {
    integer actpop, actqes, actcat;
} dims_;

#define dims_1 dims_

struct {
    doublereal y[83700]	/* was [1395][12][5] */;
    integer group[1395];
} rawdat_;

#define rawdat_1 rawdat_

struct {
    doublereal muz, alphz1, betaz1, betaz2, muo, alpho1, betao1, betao2, psi2,
	     psi3, psi4, psi5, psi6, tau1, tau2, tau3, tau4, tau5, tau6;
} params_;

#define params_1 params_

/* Subroutine */ int keycalc_(i__, z0, z1, likely)
integer *i__;
doublereal *z0, *z1, *likely;
{
    /* Initialized data */

    static doublereal r__[5] = { 1.609438,2.302585,2.302585,1.609438,0. };
    static doublereal s[5] = { 1.,2.,3.,4.,5. };

    /* System generated locals */
    integer i__1, i__2;

    /* Builtin functions */
    double exp();

    /* Local variables */
    static doublereal beta0, beta1;
    static integer j, k;
    static doublereal theta[5], expeta[5];
    static integer grpmem;
    static doublereal innpro, sumexp, eta[5];

/*     THE OFFSET VECTORS */
    grpmem = rawdat_1.group[*i__ - 1];
/*     FIRST FIND BETA0 (THE OFFSET  PARAMETER -- CONSTANT FOR THE PERSON)
 */
    beta0 = xmat_1.a[grpmem - 1] * params_1.muz + xmat_1.a[grpmem + 5] * 
	    params_1.alphz1 + xmat_1.a[grpmem + 11] * params_1.betaz1 + 
	    xmat_1.a[grpmem + 17] * params_1.betaz2 + *z0;
/*     DO FOR EACH QUESTION */
    *likely = 1.;
    i__1 = dims_1.actqes;
    for (j = 1; j <= i__1; ++j) {
	innpro = 0.;
/*     FOR THIS PERSON AND QUESTION FIND THE ETA'S */
	beta1 = xmat_1.a[grpmem - 1] * params_1.muo + xmat_1.a[grpmem + 5] * 
		params_1.alpho1 + xmat_1.a[grpmem + 11] * params_1.betao1 + 
		xmat_1.a[grpmem + 17] * params_1.betao2 + *z1;
	if (j % 2 == 0) {
	    beta1 = beta1 + xmat_1.c__[grpmem - 1] * params_1.tau1 + 
		    xmat_1.c__[grpmem + 5] * params_1.tau2 + xmat_1.c__[
		    grpmem + 11] * params_1.tau3 + xmat_1.c__[grpmem + 17] * 
		    params_1.tau4 + xmat_1.c__[grpmem + 23] * params_1.tau5 + 
		    xmat_1.c__[grpmem + 29] * params_1.tau6;
	}
	beta1 = beta1 + xmat_1.b[(j + 1) / 2 - 1] * params_1.psi2 + xmat_1.b[(
		j + 1) / 2 + 5] * params_1.psi3 + xmat_1.b[(j + 1) / 2 + 11] *
		 params_1.psi4 + xmat_1.b[(j + 1) / 2 + 17] * params_1.psi5 + 
		xmat_1.b[(j + 1) / 2 + 23] * params_1.psi6;

	sumexp = 1.;
	i__2 = dims_1.actcat;
	for (k = 1; k <= i__2; ++k) {
	    eta[k - 1] = r__[k - 1] * beta0 + s[k - 1] * beta1;
	    expeta[k - 1] = exp(eta[k - 1]);
	    sumexp += expeta[k - 1];
	    innpro += eta[k - 1] * rawdat_1.y[*i__ + (j + k * 12) * 1395 - 
		    18136];
/* L20: */
	}
	i__2 = dims_1.actcat;
	for (k = 1; k <= i__2; ++k) {
	    theta[k - 1] = expeta[k - 1] / sumexp;
/* L30: */
	}
/*          WRITE(*,9999) BETA0,BETA1,SUMEXP,INNPRO,LIKELY */
/*          WRITE(*,9999) (ETA(K),K=1,ACTCAT) */
/*          WRITE(*,9999) (EXPETA(K),K=1,ACTCAT) */
/*          WRITE(*,9999) (THETA(K),K=1,ACTCAT) */
/*          WRITE(*,9999) (Y(I,J,K),K=1,ACTCAT) */
	*likely = *likely * 1. / sumexp * exp(innpro);
/* L10: */
    }
/* L9998: */
/* L9999: */
} /* keycalc_ */

