rm(list=ls(all=TRUE)) #start with empty workspace

longfiles <- list.files(pattern=".csv")
longlist <- lapply(longfiles, read.csv)

selected <- lapply(longlist, function(x) {
    x[,9] = data.frame(mean=rowMeans(x[,3:8]))
    #lapply(x[,9], function(i) { floor(i) })
    x[,10] = floor((x[,9])/10)
    x
})


require(data.table)

boom <- lapply(longlist, function(x) {
    y = (x[ ,c(1, 7)])
    data.table(y)
})

dt1 <- data.table(frame_1)
dt2 <- data.table(frame_2)
setkey(dt1, index)
setkey(dt2, index)
dt3 <- data.table(index = sort(unique(c(dt1$index, dt2$index))))
> dt1[dt2[dt3, roll=TRUE], roll=TRUE]

#lapply(selected, function(x) {split(x, x$X)})
