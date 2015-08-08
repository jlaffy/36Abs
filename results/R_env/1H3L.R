N120IMML103 <- read.csv("~/36Abs/results/N120-IMML103/preh149MU7_N120-IMML103.csv")
N120NAIL107 <- read.csv("~/36Abs/results/N120-NAIL107/preh149MU7_N120-NAIL107.csv")
IMML103NAIL107 <- read.csv("~/36Abs/results/IMML103-NAIL107/preh149MU7_IMML103-NAIL107.csv")

df <- cbind(N120IMML103, N120NAIL107, IMML103NAIL107)
df <- df[-4]
df <- df[-4]
df <- df[-5]
df <- df[-5]

write.csv(df, file = "~/36Abs/results/N120-IMML103-NAIL107/preh149MU7.csv")
