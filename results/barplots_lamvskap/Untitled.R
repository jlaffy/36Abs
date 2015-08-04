lamkap <- read.csv("preh149MU5_120103.csv2.cop")
lamkap2 <- read.csv("preh149MU5_120107.csv2.cop")
kapkap2 <- read.csv("preh149MU5_103107.csv2.cop")


a.a.seq <- c(t(1:(length(preh149MU5_120103[,2]))))
colours=c("purple","cyan","orange")

df <- as.matrix(rbind(lamkap[,3], lamkap2[,3], kapkap2[,3]))
row.names(df) <- c("lamkap", "lamkap2", "kapkap2")

barplot(df, col=colours)

LK <- c(t(lamkap$lamkapim_dif))
LK2 <- c(t(lamkap2$lamkap2))
KK2 <- c(t(kapkap2$kap2kapim))

lamkaplamkap2 <- as.numeric(LK)-as.numeric(LK2)
lamkapkapkap2 <- as.numeric(LK)-as.numeric(KK2)
lamkap2kapkap2 <- as.numeric(LK2)-as.numeric(KK2)
