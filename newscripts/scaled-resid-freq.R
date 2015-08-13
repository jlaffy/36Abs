#!/usr/bin/Rscript
setwd("~/36Abs/results/tmp/CSV4plots/")
#source("XXXXX.R") #R script containing necessary functions, eg. loading data
#data <- XXXXfunction() #function in R script loaded above

## seqid_allLight are rows extracted from seqid_fullseq_allLight,
## because any 2 values are different per row.
## !!!! code to select: rows = apply(df[, 2:7], 1, function(i) length(unique(i)) > 1)
## need to write function for getting fullseq data and applying either rule above,
## or rule saying select rows where all/any value is smaller bigger than x.
## !!!! code for this selection: selectdata = df[apply(df[, -1], 1, function(x) all(x > 20)), ]

#### LIBRARIES
library(plyr)

#### FUNCTIONS
## scale vector of values to desired range (a to b)
scale.range <- function(x, a=0, b=9) {
  ((((b-a)*( x - (min(x))))/((max(x)) - (min(x)))) + a)
}

## df of weight freqs of amino acid types in selection(arg=x). ie. independent of
## i) occurrence of amino acids in whole seq(arg=y) and ii) whole seq length
weighted.freq <- function(x, y) {
  seqlength = nrow(y)
  countwhole = count(y)
  countselect = count(x)
  # add new columns to y (dataframe) displaying
  weightedcounts = as.data.frame(countwhole)
  weightedcounts[,3] = weightedcounts[,2] / seqlength  # i) weighted freq of res id in whole seq
  weightedcounts = merge(weightedcounts, countselect, by=colnames(y$x))   # ii) only rows of y where amino acids in x exist also
  weightedcounts[,5] = weightedcounts[,3] * weightedcounts[,4] # prob of res id in selected
  colnames(weightedcounts)[2:5] = c("freqWhole", "wfreqWhole", "freqSelect", "wfreqSelect")
  return(weightedcounts)
}

subset.data <- function(shortlist, longlist) {
  for (i in 1:10) {
    x = shortlist[1]
    y = longlist[2]
    #return(list(x,y))
  }
}

load.data.short <- function() {
  shortfiles <- list.files(pattern=".csv", full.names=TRUE)
  shortlist <- lapply(shortfiles, read.csv)
}

load.data.long <- function() {
  longfiles <- list.files("fullseq", pattern=".csv", full.names=TRUE)
  longlist <- lapply(longfiles, read.csv)
}
