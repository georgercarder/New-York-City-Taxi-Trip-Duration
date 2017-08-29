#!/bin/Rscript

orgnshft.x<-function(x1)(x1+73.99363875389099)
orgnshft.y<-function(x2)(x2-40.736031073752805)
#x1,y1 are in rotated basis. of length 0.1 mile

#new origin is E 14th and 5th Ave
p<-pi/5
cp<-cos(p)
sp<-sin(p)

rotate<-function(A,B)c((cp*A-sp*B),(sp*A+cp*B))

#rotation transformation

#shift all points
m<-nrow(train.s)
pu.x.ob=pu.y.ob=drop.x.ob=drop.y.ob=pu.x.tb=pu.y.tb=drop.x.tb=drop.y.tb<-rep(0,m)
i=1
while(i <=m){
    pu.x.ob[i]<-orgnshft.x(train.s$pickup_x[i])
    pu.y.ob[i]<-orgnshft.y(train.s$pickup_y[i])
    drop.x.ob[i]<-orgnshft.x(train.s$dropoff_x[i])
    drop.y.ob[i]<-orgnshft.y(train.s$dropoff_y[i])
    rotated.pu<-rotate(pu.x.ob[i],pu.y.ob[i])    
    rotated.drop<-rotate(drop.x.ob[i],drop.y.ob[i])
    pu.x.tb[i]<-rotated.pu[1]
    pu.y.tb[i]<-rotated.pu[2]
    drop.x.tb[i]<-rotated.drop[1]
    drop.y.tb[i]<-rotated.drop[2]
i=i+1
}




