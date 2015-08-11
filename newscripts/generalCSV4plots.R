#!/usr/bin/Rscript

short = list.files(pattern=".{7,10}.csv$")
long = list.files(pattern="_fullseq_allLight.csv$")
for (i in 1:length(short)) assign(short[i], read.csv(short[i], col.names))
for (j in 1:length(long)) assign(long[j], read.csv(long[j]))

print(long[1:10])
print(short[1:10])

as.data.frame(short)

library(plyr)
dfc = as.data.frame(count(df, "preh149MU7"))
dfs = count(selected, "preh149MU7")
a.a.num = nrow(df)
dfc[,3] = dfc[,2]/a.a.num
dfw <- merge(dfc, dfs, by=c("preh149MU7"))
dfw[,5] = dfw[,3] * dfw[,4]
colnames(dfw)[2:5] = c("freqWhole", "wfreqWhole", "freqSelect", "wfreqSelect")
range(dfw["wfreqSelect"])

dfww = (dfw["wfreqSelect"])

myf <- function(a,b,x){
  a = ((((b-a)*( x - (min(x))))/((max(x)) - (min(x)))) + a)
  print(a)
}

lapply(dfww, myf(0,9,dfww))



preh149MU7_IMML103 <- read.csv("~/36Abs/results/tmp/big_IMML103_heavy/preh149MU7_Prob_Heavy_IMML103_big.csv")
preh149MU7_NAIL120 <- read.csv("~/36Abs/results/tmp/big_NAIL120_heavy/preh149MU7_Prob_Heavy_NAIL120_big.csv")
preh149MU7_NAIL107 <- read.csv("~/36Abs/results/tmp/big_NAIL107_heavy/preh149MU7_Prob_Heavy_NAIL107_big.csv")

preh149MU7_IMML103small <- read.csv("~/36Abs/results/tmp/small_IMML103_heavy/preh149MU7_Prob_Heavy_IMML103_small.csv")
preh149MU7_NAIL120small <- read.csv("~/36Abs/results/tmp/small_NAIL120_heavy/preh149MU7_Prob_Heavy_NAIL120_small.csv")
preh149MU7_NAIL107small <- read.csv("~/36Abs/results/tmp/small_NAIL107_heavy/preh149MU7_Prob_Heavy_NAIL107_small.csv")

#select rows from data.frame
IMML103 <- preh149MU7_IMML103[2,]
NAIL120 <- preh149MU7_NAIL120[2,]
NAIL107 <- preh149MU7_NAIL107[2,]

IMML103small <- preh149MU7_IMML103small[2,]
NAIL120small <- preh149MU7_NAIL120small[2,]
NAIL107small <- preh149MU7_NAIL107small[2,]

#exclude first element
IMML103 <- c(t(IMML103[-1]))
NAIL120 <- c(t(NAIL120[-1]))
NAIL107 <- c(t(NAIL107[-1]))

IMML103small <- c(t(IMML103small[-1]))

a.a.seq <- preh149MU7_IMML103small[1,]
a.a.seq <- c(t(a.a.seq[-1]))
a.a.seq = data.frame(a.a.seq)
a = table(a.a.seq)

big <- data.frame(NAIL120, IMML103, NAIL107)
colnames(big) = c("NAIL120big", "IMML103big", "NAIL107big")
small <- data.frame(a.a.seq, NAIL120small, IMML103small, NAIL107small)
colnames(small)[1] = "preh149MU7"

df = cbind(small,big)
rows = apply(df[, 2:7], 1, function(i) length(unique(i)) > 1)
selected = df[rows,]
#write.csv(selected, file = "~/36Abs/results/tmp/CSV4plots/preh149MU7_allLight.csv", quote=FALSE)



  
library(reshape2)
library(ggplot2)

df2 = selected[,c("NAIL120big","IMML103big","NAIL107big")]
df3 = t(df2)
df4 = melt(df3)

jpeg(file="~/36Abs/results/tmp/CSV4plots/preh149MU7_allLight.jpg", width=4, height=4, units="in", res=300)
df4plot = ggplot(data = df4, aes(x = as.factor(Var2), y = value, fill = Var1)) +
  geom_bar(stat = "identity", width = 1.5, position = position_dodge(), size=.3) + 
  scale_fill_hue(name="Light chain ID") + 
  xlab(c("Amino acid position")) + ylab(c("Contact probability")) +
  ggtitle(c("Impact of light chain on heavy chain-antigen contacts"))
dev.off()


#selected[,c("NAIL120small","NAIL120big")]

##IMMH149MV5
##97    A     0.5     0.6     0.6 (SELECTEDSMALL)(NO CHANGE WHEN BIG ANTIGEN PRESENT -- see below)
##97    A     0.5     0.5     0.5 (SELECTED)

##PREH149MU5
##97    A     0     0.1     0.1 (SELECTEDSMALL)(NO CHANGE WHEN BIG ANTIGEN PRESENT -- see below)
##97    A     0     0       0 (SELECTED)

read csv in
for each csv
count number of residues in sequence nrow(df)
count occurrences of each amino acid in the full sequence
divide each of those occurrences by the total sequence length, giving the probability of each residue occuring irrespective of context
count occurences of each amino acid in selected sequence
multiple each of thsoe occurences by the probability of the respective amino acid occurring
