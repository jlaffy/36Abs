#!/usr/bin/Rscript
preh149MU5_120107 <- read.csv("/Users/julielaffy/36Abs/results/nail120-nail107/preh149MU5_120107.csv")
preh149MU5_120103 <- read.csv("/Users/julielaffy/36Abs/results/nail120-imml103/preh149MU5_120103.csv")
preh149MU5_103107 <- read.csv("/Users/julielaffy/36Abs/results/imml103-nail107/preh149MU5_103107.csv")

df <- list(preh149MU5_120107,preh149MU5_120103,preh149MU5_103107)
sequence <- c(preh149MU5_120107[2])
sequence
seq_nums <- 1:(length(preh149MU5_120107))
seq_nums

counts <- table(preh149MU5_103107, preh149MU5_120103, preh149MU5_120107)
barplot(counts, main="Differences in preh149MU5(HC)-antigen contacts due to lambda vs. kappa pairing", xlab="sequence", ylab="contact_difference", col=c("orange,purple,cyan)", legend=rownames(counts), beside=TRUE))

        
#select rows from data.frame
cont_all_lam <- preh149MU5lam[2,]
cont_all_kap <- preh149MU5kap[2,]

#exclude first element
cont_all_lam <- c(t(cont_all_lam[-1]))
cont_all_kap <- c(t(cont_all_kap[-1]))

#x axis values

plot(sequence_nums, cont_all_lam, type="h", col="purple", lwd=6, xlab = "a.a position", ylab = "probability of contact", xaxt="n")
lines(sequence_nums, cont_all_kap, type="h", col="orange", lwd=4)
axis(side=1, at=seq(1, length(cont_all_lam), by=1))

legend('topright', c("small antigen vol","large antigen vol"), fill=c("purple","orange"), bty="n", cex = 0.85, title = "preh149MU5")
legend('topleft', c("1-30 = FR1","31-35 = CDR1","36-49 = FR2","50-68 = CDR2","69-100 = FR3", "101-121 = CDR3", "122-132 = FR4"), bty="n", cex = 0.85)

#select amino acid seq from data.frame, exclude first element, number a.as in a dataframe
a.a.seq <- preh149MU5lam[1,]
a.a.seq <- c(t(a.a.seq[-1]))
a.a.seq = data.frame(a.a.seq)

lamkap2_dif <- as.numeric(cont_all_lam)-as.numeric(cont_all_kap)
as.factor(lamkap2_dif)
df <- data.frame(a.a.seq, lamkap2_dif)
write.csv(df, file = "~/36Abs/results/nail120-nail107/preh149MU5_120107.csv")

