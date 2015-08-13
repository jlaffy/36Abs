#!/usr/bin/Rscript
rm(list=ls(all=TRUE)) #start with empty workspace
initial.dir = getwd()
setwd("~/36Abs/newscripts")
source("scaled-resid-freq.R") #R script containing necessary functions, eg. loading data

shortdata = load.data.short() #function in R script loaded above
longdata = load.data.long()

#weighted.freq <- function(x, y) {
#  seqlen = nrow(y)
  #as.data.frame(x)
  #as.data.frame(y)
  #countwhole = 
 # count(y[,2])
  #countselect = 
 # count(x[,2])
 # add new columns to y (dataframe) displaying
  #countwhole[,3] = countwhole[,2] / seqlen  # i) weighted freq of res id in whole seq
  #countwhole = merge(countwhole, countselect, by=colnames(countwhole[1]))   # ii) only rows of y where amino acids in x exist also
  #countwhole[,5] = countwhole[,3] * countwhole[,4] # prob of res id in selected
  #colnames(countwhole)[1:5] = c(colnames(y[2]), "freqWhole", "wfreqWhole", "freqSelect", "wfreqSelect")
  #return(countwhole)
}  
#out=data.frame()
  #out=rbind(out,countwhole)
out = as.data.frame(out)

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
  lst = countwhole)
  #out=rbind(out,countwhole)
}
#}
table.freq(shortdata, longdata)

  
#shortsubdat = lapply(shortdata, function(x) { x[,1:2] }) ## select df from nested ls and df cols. 
#longsubdat = as.data.frame(lapply(longdata, function(y) { y[,1:2] }), rep=TRUE)
#mapply(weighted.freq, shortsubdat, longsubdat)

  #scaledtable = scale.range(x=short)
  #print(scaledtable)
#}
#weightedtable = weighted.freq(selected, whole)
#selectcounts = weightedtable["wfreqSelect"]
#newscale = as.data.frame(lapply(selectcounts, scale.range))

#finaltable = cbind(weightedtable, newscale, round(newscale))
#colnames(finaltable)[6:7]=c("range0-9", "rounded")

#setwd(initial.dir)