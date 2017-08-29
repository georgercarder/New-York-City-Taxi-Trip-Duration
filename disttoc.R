#!/bin/Rscript

disttoc=rep(0,nrow(train.s))
for(i in 1:nrow(train.s)){
    disttoc[i]=euc.dist(C,c(train.s$pickup_x[i],train.s$pickup_y[i]))

}
train.s$disttoc<-disttoc
