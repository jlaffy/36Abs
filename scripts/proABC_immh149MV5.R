immh149MV5small <- read.csv("/Users/julielaffy/OneDrive/36Abs/results/lambda_pair/proABC/immh149MV5/immh149MV5small/Prob_heavy.csv")
immh149MV5big <- read.csv("/Users/julielaffy/OneDrive/36Abs/results/lambda_pair/proABC/immh149MV5/immh149MV5big/Prob_heavy.csv")

#select rows from data.frame
cont_all <- immh149MV5small[2,]
cont_all_big <- immh149MV5big[2,]

#exclude first element
cont_all <- c(t(cont_all[-1]))
cont_all_big <- c(t(cont_all_big[-1]))

#x axis values
sequence_nums <- 1:(length(cont_all))

plot(sequence_nums, cont_all, type="h", col="purple", lwd=6, xlab = "a.a position", ylab = "probability of contact", xaxt="n")
lines(sequence_nums, cont_all_big, type="h", col="orange", lwd=4)
axis(side=1, at=seq(1, length(cont_all), by=1))

legend('topright', c("small antigen vol","large antigen vol"), fill=c("purple","orange"), bty="n", cex = 0.85, title = "immh149MV5")
legend('topleft', c("1-30 = FR1","31-35 = CDR1","36-49 = FR2","50-66 = CDR2","67-98 = FR3", "99-120 = CDR3", "121-131 = FR4"), bty="n", cex = 0.85)

#select amino acid seq from data.frame, exclude first element, number a.as in a dataframe
a.a.seq <- immh149MV5small[1,]
a.a.seq <- c(t(a.a.seq[-1]))
a.a.seq <- data.frame(a.a.seq)
