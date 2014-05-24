## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
y<-NEI[NEI$fips %in% c("24510","06037"),]
## Require ggplot2 and plyr
require(plyr)
require(ggplot2)
## Porcess data
data<-join(y,SCC,by="SCC")
x<-data$SCC.Level.Two[grepl("vehicle",data$SCC.Level.Two,ignore.case = TRUE, ) == TRUE]
x<-as.character(unique(x))
newdata<-data[data$SCC.Level.Two %in% x,]
x<-aggregate(newdata$Emissions,by=list(newdata$year,newdata$fips),FUN=sum)
## Save image to file
png(filename="plot6.png")
qplot(Group.1,x,data=x,xlab="year",ylab="total emissions",facets=Group.2~.)
dev.off()