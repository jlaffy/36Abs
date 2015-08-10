id = c("immh103MV2","immh149MV5", "immh159MU5", "naih11", "preh118", "preh119", "preh146", "preh138MV4", "preh149MU5", "preh149MU7")
filenames <- list.files(full.names=TRUE)  
All <- lapply(filenames,function(i)
  read.csv(i, header=TRUE, skip=4)
)

for (i in files) {
  for (j in id)
    count(selected, j)
}
setwd("./Data")
