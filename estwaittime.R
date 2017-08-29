#!/bin/Rscript

##functions
orgnshft.x<-function(x1)(x1+73.99363875389099)
orgnshft.y<-function(x2)(x2-40.736031073752805)
## CONVERT P1 P2
#x1,y1 are in rotated basis. of length 0.1 mile
#new origin is E 14th and 5th Ave
center<-function(p1,p2)c((p1[1]+p2[1])/2,(p1[2]+p2[2])/2)
taxi.dist<-function(x1,x2)sum(sqrt((x1-x2)^2))
radius.taxi<-function(p1,p2)(1/2)*taxi.dist(p1,p2)
#convert!
p<-pi/5
cp<-cos(p)
sp<-sin(p)
rotate<-function(A,B)c((cp*A-sp*B),(sp*A+cp*B))
#rotation transformation
#shift all points


##
estwait<-rep(0,500)
j=1
p1<-data.frame(test$pickup_longitude,test$pickup_latitude)
p2<-data.frame(test$dropoff_longitude,test$dropoff_latitude)
t<-test$time

while(j<=500){

####
#Given
#p1 p2 t

#GIVEN p1 p2
p1.x.ob=p1.y.ob=p2.x.ob=p2.y.ob=p1.x.tb=p1.y.tb=p2.x.tb=p2.y.tb=c.x.ob=c.y.ob=c.x.tb=c.y.tb=0
    p1.x.ob<-orgnshft.x(p1[j,1])
    p1.y.ob<-orgnshft.y(p1[j,2])
    p2.x.ob<-orgnshft.x(p2[j,1])
    p2.y.ob<-orgnshft.y(p2[j,2])

    rotated.p1<-rotate(p1.x.ob,p1.y.ob)    
    rotated.p2<-rotate(p2.x.ob,p2.y.ob)    
    rotated.C<-rotate(c.x.ob,c.y.ob)    

    p1.x.tb<-rotated.p1[1]
    p1.y.tb<-rotated.p1[2]
    p2.x.tb<-rotated.p2[1]
    p2.y.tb<-rotated.p2[2]

C<-center(c(p1.x.tb,p1.y.tb),c(p2.x.tb,p2.y.tb))
    
###conversion into taxi basis
###
d<-taxi.dist(p1[j,],p2[j,])
r<-radius.taxi(p1[j,],p2[j,])
source("disttoc.taxi.R")

train.s.r<-train.s[train.s$disttoc.taxi<r,]
train.s.r.d<-train.s.r[(train.s.r$taxicrowsflt<(d+0.0002))&(train.s.r$taxicrowsflt>(d-0.0002)),]

if((t[j]>=0&t[j]<=7)||(t[j]>=20&t[j]<=23)){
train.s.r.d.t<-train.s.r.d[train.s.r.d$time<=7,]
}else{
train.s.r.d.t<-train.s.r.d[train.s.r.d$time>7,]
}

traveltime<-mean(train.s.r.d.t$trip_duration)
print("traveltime is")
print(traveltime)

estwait[j]=traveltime
####
j=j+1
}













