#!/bin/Rscript

#Given
#p1 p2 t
center<-function(p1,p2)c((p1[1]+p2[1])/2,(p1[2]+p2[2])/2)
euc.dist<-function(p1,p2)sqrt(sum((p1-p2)^2))
radius<-function(p1,p2)(1/2)*euc.dist(p1,p2)
#functions we need

C<-center(p1,p2)
d<-euc.dist(p1,p2)
r<-radius(p1,p2)
r.train.s<-train.s[sample(nrow(train.s),100000,replace=TRUE,prob=NULL),]
#gives us smaller random sample to work with. prevents overfitting data and also speeds things up.

source("rand.disttoc.R")
#call disttoc so we can find trips within a certain distance of center. Want to work only with trip data in this "neighborhood".

r.train.s.r<-r.train.s[r.train.s$rand.disttoc<r,]
#gives us data in this neighborhood

r.train.s.r.d<-r.train.s.r[(r.train.s.r$crowsflight<(d+0.01))&(r.train.s.r$crowsflight>(d-0.01)),]
#gives us trips of about same length



traveltime<-mean(r.train.s.r.d$trip_duration)

print("traveltime is")
print(traveltime)

















