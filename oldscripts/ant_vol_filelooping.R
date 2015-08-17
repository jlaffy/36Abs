small_files <- ("~/Desktop/36Abs/results/lambda_pair/proABC/immh103MU2/immh103MU2small/Prob_heavy_small.csv, ~/Desktop/36Abs/results/lambda_pair/proABC/immh103MV2small/Prob_heavy.csv, ~/Desktop/36Abs/results/lambda_pair/proABC/immh149MV5small/Prob_heavy.csv, ~/Desktop/36Abs/results/lambda_pair/proABC/immh159MU5small/Prob_heavy.csv, ~/Desktop/36Abs/results/lambda_pair/proABC/naih111small/Prob_heavy.csv, ~/Desktop/36Abs/results/lambda_pair/proABC/preh118small/Prob_heavy.csv, ~/Desktop/36Abs/results/lambda_pair/proABC/preh119small/Prob_heavy.csv, ~/Desktop/36Abs/results/lambda_pair/proABC/preh138MV4small/Prob_heavy.csv, ~/Desktop/36Abs/results/lambda_pair/proABC/preh146small/Prob_heavy.csv, ~/Desktop/36Abs/results/lambda_pair/proABC/preh149MU5small/Prob_heavy.csv, ~/Desktop/36Abs/results/lambda_pair/proABC/preh149MU7small/Prob_heavy.csv, ~/Desktop/36Abs/results/lambda_pair/proABC/preh159MV6small/Prob_heavy.csv")
big_files <- ("~/Desktop/36Abs/results/lambda_pair/proABC/immh103MU2/immh103MU2big/Prob_heavy.csv, ~/Desktop/36Abs/results/lambda_pair/proABC/immh103MV2big/Prob_heavy.csv, ~/Desktop/36Abs/results/lambda_pair/proABC/immh149MV5big/Prob_heavy.csv, ~/Desktop/36Abs/results/lambda_pair/proABC/immh159MU5big/Prob_heavy.csv, ~/Desktop/36Abs/results/lambda_pair/proABC/naih111big/Prob_heavy.csv, ~/Desktop/36Abs/results/lambda_pair/proABC/preh118big/Prob_heavy.csv, ~/Desktop/36Abs/results/lambda_pair/proABC/preh119big/Prob_heavy.csv, ~/Desktop/36Abs/results/lambda_pair/proABC/preh138MV4big/Prob_heavy.csv, ~/Desktop/36Abs/results/lambda_pair/proABC/preh146big/Prob_heavy.csv, ~/Desktop/36Abs/results/lambda_pair/proABC/preh149MU5big/Prob_heavy.csv, ~/Desktop/36Abs/results/lambda_pair/proABC/preh149MU7big/Prob_heavy.csv, ~/Desktop/36Abs/results/lambda_pair/proABC/preh159MV6big/Prob_heavy.csv")

for (i in seq_along(1:length(small_files)): {
  big <- c(big_files[i])
  print(big)

}

     #select rows from data.frame
     cont_all <- immh103MU2small[2,]
     cont_all_big <- immh103MU2big[2,]
     
     #exclude first element
     cont_all <- c(t(cont_all[-1]))
     cont_all_big <- c(t(cont_all_big[-1]))
     
     #x axis values
     sequence_nums <- 1:(length(cont_all)-1)
     
     
     plot(sequence_nums, cont_all, type="h", col="blue", lwd=4)
     lines(sequence_nums, cont_all_big, type="h", col="yellow", lwd=3)
     
     
     #noX = subset(cont_all,grepl("^.+(X)$", cont_all))
     
     #legend('topright', names(cont_all), lty=1, lwd=4, col=c('yellow'), bty='o', cex=.75)
     #legend('topright', names(cont_all_big), lty=1, lwd=4, col=c('blue'), bty='o', cex=.75)
     