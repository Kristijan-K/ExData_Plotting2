## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
## Require ggplot2 and plyr
require(plyr)
require(ggplot2)
## Porcess data
data<-join(NEI,SCC,by="SCC")
x<-data$EI.Sector[grepl("coal",data$EI.Sector,ignore.case = TRUE, ) == TRUE]
x<-as.character(unique(x))
newdata<-data[data$EI.Sector %in% x,]
x<-aggregate(newdata$Emissions,by=list(newdata$year),FUN=sum)
## Save image to file
png(filename="plot4.png")
plot(x$Group.1,x$x,xlab="year",ylab="total emissions")
dev.off()