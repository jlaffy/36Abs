#!/usr/bin/Rscript

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
NAIL120small <- c(t(NAIL120small[-1]))
NAIL107small <- c(t(NAIL107small[-1]))

a.a.seq <- preh149MU7_IMML103small[1,]
a.a.seq <- c(t(a.a.seq[-1]))
a.a.seq = data.frame(a.a.seq)

big <- data.frame(NAIL120, IMML103, NAIL107)
colnames(big) = c("NAIL120big", "IMML103big", "NAIL107big")
small <- data.frame(a.a.seq, NAIL120small, IMML103small, NAIL107small)
colnames(small)[1] = "preh149MU7"

df = cbind(small,big)
rows = apply(df[, 2:7], 1, function(i) length(unique(i)) > 1)
selected = df[rows,]

write.csv(selected, file = "~/36Abs/results/tmp/CSV4plots/preh149MU7_allLight.csv", quote=FALSE)

##IMMH149MV5
##97    A     0.5     0.6     0.6 (SELECTEDSMALL)(NO CHANGE WHEN BIG ANTIGEN PRESENT -- see below)
##97    A     0.5     0.5     0.5 (SELECTED)

##PREH149MU5
##97    A     0     0.1     0.1 (SELECTEDSMALL)(NO CHANGE WHEN BIG ANTIGEN PRESENT -- see below)
##97    A     0     0       0 (SELECTED)
