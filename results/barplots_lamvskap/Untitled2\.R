lamkap <- read.csv("preh149MU5_120103.csv2.cop")
lamkap2 <- read.csv("preh149MU5_120107.csv2.cop")
kapkap2 <- read.csv("preh149MU5_103107.csv2.cop")

LK <- (lamkap$lamkapim_dif)
LK2 <- (lamkap2$lamkap2_dif)
KK2 <- (kapkap2$kap2kapim_dif)

barplot(height=LK,LK2,KK2, beside=TRUE, names.arg=c("lamkap", "lamkap2", "kapkap2"))
