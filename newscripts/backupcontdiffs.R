#!/usr/bin/Rscript
preh138MV4small <- read.csv("/Users/julielaffy/36Abs/results/kappa_pairs/proABC/NAIL107/preh138MV4/preh138MV4small/Prob_Heavy.csv")
preh138MV4big <- read.csv("/Users/julielaffy/36Abs/results/kappa_pairs/proABC/NAIL107/preh138MV4/preh138MV4big/Prob_Heavy.csv")

#select rows from data.frame
cont_all <- preh138MV4small[2,]
cont_all_big <- preh138MV4big[2,]

#exclude first element
cont_all <- c(t(cont_all[-1]))
cont_all_big <- c(t(cont_all_big[-1]))

#x axis values
sequence_nums <- 1:(length(cont_all))

plot(sequence_nums, cont_all, type="h", col="purple", lwd=6, xlab = "a.a position", ylab = "probability of contact", xaxt="n")
lines(sequence_nums, cont_all_big, type="h", col="orange", lwd=4)
axis(side=1, at=seq(1, length(cont_all), by=1))

legend('topright', c("small antigen vol","large antigen vol"), fill=c("purple","orange"), bty="n", cex = 0.85, title = "preh138MV4")
legend('topleft', c("1-30 = FR1","31-35 = CDR1","36-49 = FR2","50-68 = CDR2","69-100 = FR3", "101-121 = CDR3", "122-132 = FR4"), bty="n", cex = 0.85)

#select amino acid seq from data.frame, exclude first element, number a.as in a dataframe
a.a.seq <- preh138MV4small[1,]
a.a.seq <- c(t(a.a.seq[-1]))
a.a.seq = data.frame(a.a.seq)

cont_all_dif <- as.numeric(cont_all_big)-as.numeric(cont_all)
as.factor(cont_all_dif)
df <- data.frame(a.a.seq, cont_all_dif)
write.csv(df, file = "~/36Abs/results/kappa_pairs/proABC/NAIL107/preh138MV4/preh138MV4cont_diff.csv")
