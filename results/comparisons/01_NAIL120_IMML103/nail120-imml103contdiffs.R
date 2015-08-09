#!/usr/bin/Rscript
preh149MU7lam <- read.csv("/Users/julielaffy/36Abs/results/lambda_pair/proABC/preh149MU7/preh149MU7big/Prob_Heavy.csv")
preh149MU7kap <- read.csv("/Users/julielaffy/36Abs/results/kappa_pairs/proABC/NAIL107/preh149MU7/preh149MU7big/Prob_Heavy.csv")

#select rows from data.frame
cont_all_lam <- preh149MU7lam[2,]
cont_all_kap <- preh149MU7kap[2,]

#exclude first element
cont_all_lam <- c(t(cont_all_lam[-1]))
cont_all_kap <- c(t(cont_all_kap[-1]))

#x axis values
sequence_nums <- 1:(length(cont_all_lam))

plot(sequence_nums, cont_all_lam, type="h", col="purple", lwd=6, xlab = "a.a position", ylab = "probability of contact", xaxt="n")
lines(sequence_nums, cont_all_kap, type="h", col="orange", lwd=4)
axis(side=1, at=seq(1, length(cont_all_lam), by=1))

legend('topright', c("small antigen vol","large antigen vol"), fill=c("purple","orange"), bty="n", cex = 0.85, title = "preh149MU7")
legend('topleft', c("1-30 = FR1","31-35 = CDR1","36-49 = FR2","50-68 = CDR2","69-100 = FR3", "101-121 = CDR3", "122-132 = FR4"), bty="n", cex = 0.85)

#select amino acid seq from data.frame, exclude first element, number a.as in a dataframe
a.a.seq <- preh149MU7lam[1,]
a.a.seq <- c(t(a.a.seq[-1]))
a.a.seq = data.frame(a.a.seq)

lamkapim_dif <- as.numeric(cont_all_lam)-as.numeric(cont_all_kap)
as.factor(lamkapim_dif)
df <- data.frame(a.a.seq, lamkapim_dif)
write.csv(df, file = "~/36Abs/results/N120-NAIL107/preh149MU7_N120-NAIL107.csv")

