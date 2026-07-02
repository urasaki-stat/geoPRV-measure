#####   Function of geometric mean type of PRV measure   #####
#  dat : the two-way contingency table of size R × C, where R, C > 1
#    f : the function f(x) with tuning parameter a given to geoPRV measure, and satisfies the following conditions:
#        (i) f(x) is a convex function, (ii) 0·f(0/0) = 0, (iii) lim x→+0 f(x) = 0, and (iv) f(1) = 0
# para : the tuning parameter given to f(x)

geoPRV <- function(dat, f, para){
  # Retrieving the function and its derivative
  f_d <- deriv(f, "x", function(x, a=para){} )
  n <- sum(dat)  # Total number of classifications in the table
  p <- dat/n     # Matrix of joint relative proportions
  pi <- apply(p, 1, sum) # Row marginal proportions
  pj <- apply(p, 2, sum) # Column marginal proportions
  
  # Constructing the geometric mean type of PRV measure
  VY <- -1*sum(f_d(pj))
  E.VYX <- prod(apply(-1*f_d(p/pi), 1, sum)^pi)
  geoPRV <- (VY-E.VYX)/VY
  
  # Constructing the approximate confidence interval for measure
  epsilon1 <- matrix(rep(apply(f_d(p/pi), 1, sum), ncol(dat)), nrow(dat))
  epsilon2 <- matrix(rep(apply(-1*p/pi*matrix(attr(f_d(p/pi),"g"), nrow(dat)),1, sum), ncol(dat)), nrow(dat))
  epsilon3 <- matrix(attr(f_d(p/pi),"g"), nrow(dat))
  epsilonij <- log(-1*epsilon1)+(epsilon2+epsilon3)/epsilon1
  
  Delta <- matrix(rep(attr(f_d(pj),"g"), each=nrow(dat)), nrow(dat))+epsilonij*VY
  
  sigma <- (E.VYX/VY^2)^2*(sum(p*Delta^2) - sum(p*Delta)^2)
  se <- sqrt(sigma/n)
  
  ci.low <- geoPRV - se*qnorm(0.975, 0, 1)
  ci.up <- geoPRV + se*qnorm(0.975, 0, 1)
  
  list(Data=dat,
       geoPRV = round(geoPRV, 4),
       SE = round(se, 4),
       CI = round(c(ci.low, ci.up), 4)
       ) 
}

