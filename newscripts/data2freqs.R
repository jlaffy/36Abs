#!/usr/bin/Rscript
rm(list=ls(all=TRUE)) #start with empty workspace
initial.dir = getwd()
setwd("~/36Abs/newscripts")
source("scaled-resid-freq.R") #R script containing necessary functions, eg. loading data

scale.range <- function(x, a=0, b=9) {
  ((((b-a)*( x - (min(x))))/((max(x)) - (min(x)))) + a)
}

shortdata = load.data.short() #function in R script loaded above
longdata = load.data.long()

#df = data.frame()
out = data.frame()
#table.freq <- function(x,y){
for (i in 1:10){
  x = shortdata[[i]][1:2]
  y = longdata[[i]][1:2]
  countwhole= count(y[,2])
  countselect = count(x[,2])
  seqlen = nrow(y)
  countwhole[,3] = countwhole[,2] / seqlen
  countwhole = merge(countwhole, countselect, by=colnames(countwhole[1]))
  countwhole[,5] = countwhole[,3] * countwhole[,4]
  colnames(countwhole)[1:5] = c(colnames(y[2]), "freqWhole", "wfreqWhole", "freqSelect", "wfreqSelect")
  selectcounts = countwhole["wfreqSelect"]
  newscale = as.data.frame(lapply(selectcounts, scale.range))
  finaltable = cbind(countwhole, newscale, round(newscale))
  colnames(finaltable)[6:7]=c("range0-9", "rounded")
  print(finaltable)
  #out = smartbind(out,countwhole)
  #data.frame(rbindlist(list(out,countwhole)))
}

#}
#table.freq(shortdata, longdata)

#shortsubdat = lapply(shortdata, function(x) { x[,1:2] }) ## select df from nested ls and df cols. 
#longsubdat = as.data.frame(lapply(longdata, function(y) { y[,1:2] }), rep=TRUE)
#mapply(weighted.freq, shortsubdat, longsubdat)

  #scaledtable = scale.range(x=short)
  #print(scaledtable)




#setwd(initial.dir)
