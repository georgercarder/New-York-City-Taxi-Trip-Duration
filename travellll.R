#!/bin/Rscript

#Given
#p1 p2 t

center<-function(p1,p2)c((p1[1]+p2[1])/2,(p1[2]+p2[2])/2)
euc.dist<-function(p1,p2)sqrt(sum((p1-p2)^2))
radius<-function(p1,p2)(1/2)*euc.dist(p1,p2)

C<-center(p1,p2)
d<-euc.dist(p1,p2)
r<-radius(p1,p2)
source("disttoc.R")

train.s.r<-train.s[train.s$disttoc<r,]
train.s.r.d<-train.s.r[(train.s.r$crowsflight<(d+0.0002))&(train.s.r$crowsflight>(d-0.0002)),]

if((t>=0&t<=7)||(t>=20&t<=23)){
train.s.r.d.t<-train.s.r.d[train.s.r.d$time<=7,]
}else{
train.s.r.d.t<-train.s.r.d[train.s.r.d$time>7,]
}

traveltime<-mean(train.s.r.d.t$trip_duration)
print("traveltime is")
print(traveltime)















