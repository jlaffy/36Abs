#!/usr/bin/Rscript
rm(list=ls(all=TRUE)) #start with empty workspace
initial.dir = getwd()
setwd("~/36Abs/newscripts")
source("scaled-resid-freq.R") #R script containing necessary functions, eg. loading data

data = load.data() #function in R script loaded above

#weighted.freq <- function(x, y) {
  seqlength = length(y)
  countwhole = count(y)
  countselect = count(x)
  # add new columns to y (dataframe) displaying
  weightedcounts = as.data.frame(countwhole)
  weightedcounts[,3] = weightedcounts[,2] / seqlength  # i) weighted freq of res id in whole seq
  weightedcounts = merge(weightedcounts, countselect, by=colnames(countwhole[1]))   # ii) only rows of y where amino acids in x exist also
  weightedcounts[,5] = weightedcounts[,3] * weightedcounts[,4] # prob of res id in selected
  colnames(weightedcounts)[2:5] = c("freqWhole", "wfreqWhole", "freqSelect", "wfreqSelect")
  return(weightedcounts)
#}

setwd(initial.dir)
weighted.freq <- function(x, y) {
  seqlength = length(y)
  countwhole = as.data.frame(count(y))
  countselect = as.data.frame(count(x))
  countwhole[,3] = countwhole[,2] / seqlength
  final = merge(countwhole, countselect, by=colnames(countwhole[1]))
}
  
for (i in 1:10){
  x = data[[1]][[i]][[2]]
  y = data[[2]][[i]][[2]]
  table = weighted.freq(x,y)
}

print(table)
}


  #scaledtable = scale.range(x=short)
  #print(scaledtable)
#}
weightedtable = weighted.freq(selected, whole)
selectcounts = weightedtable["wfreqSelect"]
newscale = as.data.frame(lapply(selectcounts, scale.range))

finaltable = cbind(weightedtable, newscale, round(newscale))
colnames(finaltable)[6:7]=c("range0-9", "rounded")

#setwd(initial.dir)