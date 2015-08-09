#!/usr/bin/Rscript


"/Users/julielaffy/36Abs/results/lambda_pair/proABC/preh149MU7/preh149MU7small/Prob_Heavy.csv"
dir <- "~/36Abs/results"
work <- ("/1_NAIL120","/1_IMML103","/1_NAIL107")
files <- (""

lapply(files, 
x1 <- read.csv(file.path(dir, work, files))

	

		preh149MU7small <- read.csv(path)
		preh149MU7big <- read.csv("/Users/julielaffy/36Abs/results/lambda_pair/proABC/preh149MU7/preh149MU7big/Prob_Heavy.csv")

		#select rows from data.frame
		cont_all <- preh149MU7small[2,][-1]
		cont_all
		cont_all_big <- preh149MU7big[2,]
		cont_all_dif <- as.numeric(cont_all_big)-as.numeric(cont_all)
		
	#	#exclude first element
	#	cont_all <- c(t(cont_all[-1]))
	#	cont_all_big <- c(t(cont_all_big[-1]))
	#	
	#	#x axis values
	#	sequence_nums <- 1:(length(cont_all))	
	#
	#	#as.factor(cont_all_dif)
	#	df <- data.frame(a.a.seq, cont_all)
	#	write.csv(df, file = "~/36Abs/results/lambda_pair/proABC/preh149MU7/preh149MU7cont_small.csv", quote=FALSE)
