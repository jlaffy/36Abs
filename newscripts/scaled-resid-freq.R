selectdata = df[apply(df[, -1], 1, function(x) all(x > 20)), ]

#### LIBRARIES
library(plyr)

#### FUNCTIONS
## scale vector of values to desired range (a to b)
scale.range <- function(x, a=0, b=9) {
        a = ((((b-a)*( x - (min(x))))/((max(x)) - (min(x)))) + 0)
        print(a)
}

## df of weight freqs of amino acid types in selection(arg=x). ie. independent of
## i) occurrence of amino acids in whole seq(arg=y) and ii) whole seq length
weighted.freq <- function(x=dfc, y=df, c=scale) {
        seq.length = nrow(y)
        count.whole = count(y, colnames(y[1]))
        count.select = count(x, colnames(x[1]))

        # add new columns to y (dataframe) displaying
        # i) weighted freq of res id in whole seq
        # ii) only rows of y where amino acids in x exist also
        weighted.counts = as.data.frame(count.whole)
        weighted.counts[,3] = weighted.counts[,2] / seq.length
        weighted.counts = merge(weighted.counts, count.select, by=colnames(y[1]))
        weighted.counts[,5] = weighted.counts[,3] * weighted.counts[,4]
        colnames(weighted.counts)[2:5] = c("freqWhole", "wfreqWhole", "freqSelect", "wfreqSelect")

        ## find range of selected frequencies and scale to new range,
        ## ie. to non arbitrary min and max values (a and b). cbind to weighted.counts
        select.counts = weighted.counts["wfreqSelect"]
        print(range(select.counts))
        if c=scale
                newscale = as.data.frame(lapply(select.counts, scale.range, b=1))
                final = cbind(weighted.counts, newscale, round(newscale))
                colnames(final)[6:7]=c("range0-9", "rounded")
                print(range(final))
}




#selectdata = as.data.frame(count(df, "preh149MU7"))
#dfs = count(selected, "preh149MU7")
a.a.num = nrow(df)
#dfc[,3] = dfc[,2]/a.a.num
dfw <- merge(dfc, selectdata, by=c("preh149MU7"))
dfw[,5] = dfw[,3] * dfw[,4]
colnames(dfw)[2:5] = c("freqWhole", "wfreqWhole", "freqSelect", "wfreqSelect")
range(dfw["wfreqSelect"])

dfww = (dfw["wfreqSelect"])

newscale = as.data.frame(lapply(dfww, scale.range, b=1))
dfnew = cbind(dfw,newscale,round(newscale))
colnames(dfnew)[6:7]=c("range0-9","rounded")
dfnew
#df["NAIL120small" >= 70, ]



start with csvs with prob heavy for all heavy chains (subjects - ie rows)
with each light chain partner (variables - ie columns)
and in presence of small or large antigen (also variables, columns)
generate all.csv
