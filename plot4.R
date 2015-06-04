setwd("C:/R/explory data analysis/week1")
i <- 1
while(i <= 200000){
        r <- read.table("household_power_consumption.txt",nrows=1,sep=";",
                        skip=i) 
        r1 <- strptime(r[,1],"%d/%m/%Y")
        if(r1>"2007-02-02"){
                j <- i
                break
        }
        i <- i+10000
}
r <- read.table("household_power_consumption.txt",nrows=10000,sep=";",
                skip=j-10000) 
r1 <- as.Date(r[,1],"%d/%m/%Y")
r <- cbind(r1,r[,-1])
rn <- r[r[,1]=="2007-02-01"|r[,1]=="2007-02-02",]
colnames(rn) <- c("Date","Time","Global_active_power","Global_reactive_power",
                  "Voltage","Global_intersity","sub_metering_1",
                  "sub_metering_2","sub_metering_3")
r1 <- rn[,1]
r2 <- rn[,2]
rt <- paste(r1,r2)
rtt <- strptime(rt,"%Y-%m-%d %T")
r3 <- as.numeric(as.character(rn[,3]))
r4 <- as.numeric(as.character(rn[,4]))
r5 <- as.numeric(as.character(rn[,5]))
r7 <- as.numeric(as.character(rn[,7]))
r8 <- as.numeric(as.character(rn[,8]))
r9 <- as.numeric(as.character(rn[,9]))
par(mar=c(4,4,4,2),mfrow=c(2,2))
plot(rtt,r3,type="l",ylab="Global Active Power",xlab="")
plot(rtt,r5,type="l",ylab="Voltage",xlab="datetime")
plot(rtt,r7,type="l",ylab="Energy sub metering",xlab="")
lines(rtt,r8,type="l",col="red")
lines(rtt,r9,type="l",col="blue")
legend("topright",legend=c("sub_metering_1","sub_metering_2","sub_metering_3"),
       lty=1,col=c("black","red","blue"),cex=0.6,bty="n")
plot(rtt,r4,type="l",ylab="Global_reactive_power",xlab="datetime")
dev.copy(png,"plot4.png",width=480,height=480)
dev.off()