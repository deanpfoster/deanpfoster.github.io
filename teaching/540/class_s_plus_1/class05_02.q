### Step by step logistic regression.
### See how to use Newton-Raphson to do logistic regression.
### For the canonical link example, this is also the method of scoring
### and a IRLS algorithm

### the response vector.

y <- c(1,0,0,0,1,1,0)

### the designm matrix

x <- matrix ( c(1,1,
                1,1,
                1,1,
                1,1,
                1,-1,
                1,-1,
                1,-1),byrow=T,ncol=2)

### initial guess for regression coefs.
beta <- c(0,0) # initial guess.

### find the score.
t(x) %*% (y - exp(x %*% beta)/(1 + exp(x %*% beta))) 


### find the Hessian
t(x) %*% diag( c(exp(x %*% beta)/(1 + exp(x %*% beta))^2)) %*% x

### update
beta <- solve(t(x) %*% diag( c(exp(x %*% beta)/(1 + exp(x %*% beta))^2)) %*% x,
      t(x) %*% (y - exp(x %*% beta)/(1 + exp(x %*% beta))) ) + beta


### repeat a few times. Very fast convergence.

### Invert the Hessian to get the asymptotic "observed information"
### solve, with a matrix argument, finds the inverse of a matrix.

solve(t(x) %*% diag( c(exp(x %*% beta)/(1 + exp(x %*% beta))^2)) %*% x)


### See the glm result. (-1) because we don't need the constant twice.

summary(glm(y ~ -1 + x, family = "binomial"))




