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
par(mar=c(4,4,4,2))
plot(rtt,r3,type="l",ylab="Global Active Power(kilowatts)",xlab="")
dev.copy(png,"plot2.png",width=480,height=480)
dev.off()

