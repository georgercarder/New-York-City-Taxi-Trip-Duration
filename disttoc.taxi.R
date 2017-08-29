#!/bin/Rscript


taxi.dist<-function(x1,x2)sum(sqrt((x1-x2)^2))

disttoc.taxi=rep(0,nrow(train.s))
for(i in 1:nrow(train.s)){
    disttoc.taxi[i]=taxi.dist(C,c(train.s$pu.x.tb[i],train.s$pu.y.tb[i]))

}
train.s$disttoc.taxi<-disttoc.taxi
