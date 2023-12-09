
#第三讲课后作业Assignment2

getwd()
setwd("/Users/apple/Documents/史老师课程练习及作业/20231209第三讲课后作业/Aminer")
getwd()
dir()

#使用R中的数据读写，文件路径，for循环语句，
#读入路径“/assignment_idaccuracy/Aminer”总的所有文件，
#并将数据合并成为一个data.frame输出。
#要求data.frame中至少要包括论文的doi号，发表年份，杂志，标题；

library(readr)
file <- list.files("/Users/apple/Documents/史老师课程练习及作业/20231209第三讲课后作业/Aminer")
merge_data <- data.frame()
for (i in file) {
  data <- read.csv(i, header=T, sep=",")
  data <- data[,c("doi","年份","期刊","标题")]
  merge_data <- rbind(merge_data,data)
}



#使用apply家族函数替代上述步骤中的for循环
getwd()
setwd("/Users/apple/Documents/史老师课程练习及作业/20231209第三讲课后作业/Aminer")
getwd()

list <- lapply(list.files(),function(file){
  data <- read.csv(file,header=T,sep = ",")
  data <- data[,c("doi","年份","期刊","标题")]
})
merge_data2 <- do.call(rbind,list)



#将2中代码封装成为一个可以在命令行运行的脚本，
#脚本的唯一一个参数为aminer论文文件所在的路径。

####以下是脚本内容

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



####以下是命令行内容
sudo chmod +x lapply.R
./lapply.R  ~/Documents/史老师课程练习及作业/20231209第三讲课后作业/Aminer









