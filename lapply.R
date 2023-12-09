#! /usr/bin/env Rscript

args <- commandArgs(T)
path <- args[1]


#使用apply家族函数替代上述步骤中的for循环
library(readr)
getwd()
setwd(path)
getwd()

list <- lapply(list.files(),function(file){
  data <- read.csv(file,header=T,sep = ",")
  data <- data[,c("doi","年份","期刊","标题")]
})
merge_data2 <- do.call(rbind,list)

write.csv(merge_data2,file="merge_data.csv")