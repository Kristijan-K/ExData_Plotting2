## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
y<-NEI[NEI$fips=="24510",]
## Require ggplot2 and plyr
require(plyr)
## Porcess data
data<-join(y,SCC,by="SCC")
x<-data$SCC.Level.Two[grepl("vehicle",data$SCC.Level.Two,ignore.case = TRUE, ) == TRUE]
x<-as.character(unique(x))
newdata<-data[data$SCC.Level.Two %in% x,]
x<-aggregate(newdata$Emissions,by=list(newdata$year),FUN=sum)
## Save image to file
png(filename="plot5.png")
plot(x$Group.1,x$x,xlab="year",ylab="total emissions")
dev.off()