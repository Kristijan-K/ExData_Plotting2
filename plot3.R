## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
y<-NEI[NEI$fips=="24510",]
x<-aggregate(Y$Emissions,by=list(Y$year,Y$type),FUN=sum)
## Require ggplot2
require(ggplot2)
## Save image to file
png(filename="plot3.png")
qplot(Group.1,x,data=x,facets=Group.2~.)
dev.off()