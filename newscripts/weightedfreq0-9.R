selectdata = df[apply(df[, -1], 1, function(x) all(x > 20)), ]

library(plyr)
selectdata = as.data.frame(count(df, "preh149MU7"))
dfs = count(selected, "preh149MU7")
a.a.num = nrow(df)
dfc[,3] = dfc[,2]/a.a.num
dfw <- merge(dfc, selectdata, by=c("preh149MU7"))
dfw[,5] = dfw[,3] * dfw[,4]
colnames(dfw)[2:5] = c("freqWhole", "wfreqWhole", "freqSelect", "wfreqSelect")
range(dfw["wfreqSelect"])

dfww = (dfw["wfreqSelect"])

myf <- function(x){
  a = ((((9-0)*( x - (min(x))))/((max(x)) - (min(x)))) + 0)
  print(a)
}
newscale = as.data.frame(lapply(dfww, myf))
dfnew = cbind(dfw,newscale,round(newscale))
colnames(dfnew)[6:7]=c("range0-9","rounded")
dfnew
#df["NAIL120small" >= 70, ]




