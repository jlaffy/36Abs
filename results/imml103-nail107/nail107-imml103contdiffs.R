#!/usr/bin/Rscript
preh149MU7kap2 <- read.csv("/Users/julielaffy/36Abs/results/kappa_pairs/proABC/NAIL107/preh149MU7/preh149MU7big/Prob_Heavy.csv")
preh149MU7kap <- read.csv("/Users/julielaffy/36Abs/results/kappa_pairs/proABC/IMML103/preh149MU7/preh149MU7big/Prob_Heavy.csv")

#select rows from data.frame
cont_all_kap2 <- preh149MU7kap2[2,]
cont_all_kap <- preh149MU7kap[2,]

#exclude first element
cont_all_kap2 <- c(t(cont_all_kap2[-1]))
cont_all_kap <- c(t(cont_all_kap[-1]))

#x axis values
sequence_nums <- 1:(length(cont_all_kap2))

plot(sequence_nums, cont_all_kap2, type="h", col="purple", lwd=6, xlab = "a.a position", ylab = "probability of contact", xaxt="n")
lines(sequence_nums, cont_all_kap, type="h", col="orange", lwd=4)
axis(side=1, at=seq(1, length(cont_all_kap2), by=1))

legend('topright', c("small antigen vol","large antigen vol"), fill=c("purple","orange"), bty="n", cex = 0.85, title = "preh149MU7")
legend('topleft', c("1-30 = FR1","31-35 = CDR1","36-49 = FR2","50-68 = CDR2","69-100 = FR3", "101-121 = CDR3", "122-132 = FR4"), bty="n", cex = 0.85)

#select amino acid seq from data.frame, exclude first element, number a.as in a dataframe
a.a.seq <- preh149MU7kap2[1,]
a.a.seq <- c(t(a.a.seq[-1]))
a.a.seq = data.frame(a.a.seq)

kap2kapim_dif <- as.numeric(cont_all_kap2)-as.numeric(cont_all_kap)
as.factor(kap2kapim_dif)
df <- data.frame(a.a.seq, kap2kapim_dif)
write.csv(df, file = "~/36Abs/results/IMML103-NAIL107/preh149MU7_IMML103-NAIL107.csv")

