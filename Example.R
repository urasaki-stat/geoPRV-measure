source("geoPRV.R")

##### Example Data #####
cannabis.dat <- matrix(c(204, 211, 357, 92, 6, 13, 44, 34, 1, 5, 38, 49), nrow = 4)
dimnames(cannabis.dat) <- list(paste(c("At most once/month","Twice/month","Twice/week","More often")), 
                               paste(c("Never", "Once or twice", "More often")))

#####   Examples   #####
f_lambda <- expression((x^(a+1) -x)/a)
geoPRV(cannabis.dat, f_lambda, 1)

f_lambda0 <- expression(x*log(x))
geoPRV(cannabis.dat, f_lambda0, 0)


