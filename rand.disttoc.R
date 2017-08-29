#!/bin/Rscript

##finds the euclidean distance to center of trip, C, ignoring the taxicab metric

euc.dist<-function(x1,x2)sqrt(sum((x1-x2)^2))
##euclidean distance function

rand.disttoc=rep(0,nrow(r.train.s)) #allocate space for variable

for(i in 1:nrow(r.train.s)){
    rand.disttoc[i]=euc.dist(C,c(r.train.s$pickup_x[i],r.train.s$pickup_y[i]))


}
r.train.s$rand.disttoc<-rand.disttoc
