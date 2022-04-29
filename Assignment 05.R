library(tidyverse)

rm(list=ls(all=TRUE))
cat("\014")

#download file 
tonnage <- read.csv("TBQ05.20211116133909.csv")
str(tonnage)

#convert value to numeric
tonnage$VALUE <- as.numeric(tonnage$VALUE)

#replace "NA" values with zero 
tonnage$VALUE[is.na(tonnage$VALUE)] <- 0
tonnage$Region.of.Trade <- as.factor(tonnage$Region.of.Trade)

#print tonnage table 
tonnage2 <- tonnage[which(tonnage$Port == "All Main Irish Ports"),]
by(tonnage2$VALUE,tonnage2$Region.of.Trade,sum)

tonnage<-tonnage[which(tonnage$Port!="All Main Irish Ports" & 
                         tonnage$c01713v02044 =="l")]

#graph
ggplot(data=tonnage2) + geom_point(aes(x=Quarter, y=VALUE, color=Port)) +
  ggtitle("Quarter Tonnage Arriving From Great Britain and Northern Ireland") +
  xlab("Quarter") + ylab("Tonnage")



