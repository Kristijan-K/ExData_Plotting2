## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
y<-NEI[NEI$fips=="24510",]
## Aggregate data to get total emissions
x<-aggregate(y$Emissions,by=list(y$year),FUN=sum)
## Save image to file
png(filename="plot2.png")
plot(x$Group.1,x$x,xlab="year",ylab="total emissions")
dev.off()