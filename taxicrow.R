#!/bin/Rscript


taxi.dist<-function(x1,x2)sum(sqrt((x1-x2)^2))
m=nrow(train.s)
taxicrowsflt<-rep(0,m)
i=1
while(i<=m){

    taxicrowsflt[i]<-taxi.dist(c(train.s$pickup_x[i],train.s$pickup_y[i]),c(train.s$dropoff_x[i],train.s$dropoff_y[i]))

i=i+1
}

train.s$taxicrowsflt<-taxicrowsflt
