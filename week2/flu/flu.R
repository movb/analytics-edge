FluTrain = read.csv("FluTrain.csv")
str(FluTrain)
tail(FluTrain$Week)
which.max(FluTrain$ILI)
FluTrain[303,]
FluTrain[which.max(FluTrain$Queries),]

hist(FluTrain$ILI)
plot(log(FluTrain$ILI)~FluTrain$Queries)
FluTrend1 = lm(log(ILI) ~ Queries, data=FluTrain)
summary(FluTrend1)
cr = cor(log(FluTrain$ILI), FluTrain$Queries)
cr^2

FluTest = read.csv("FluTest.csv")
PredTest1 = exp(predict(FluTrend1, newdata=FluTest))
which(FluTest$Week == '2012-03-04 - 2012-03-11')
PredTest1[11]
(FluTest$ILI[11] - PredTest1[11])/FluTest$ILI[11]
rmse = sqrt(mean((FluTest$ILI - PredTest1)^2))
rmse

install.packages("zoo")
library(zoo)

ILILag2 = lag(zoo(FluTrain$ILI), -2, na.pad=TRUE)
FluTrain$ILILag2 = coredata(ILILag2)

plot(log(FluTrain$ILI) ~ log(ILILag2))

FluTrend2 = FluTrend1 = lm(log(ILI) ~ Queries + log(ILILag2), data=FluTrain)
summary(FluTrend2)

ILILag2Test = lag(zoo(FluTest$ILI), -2, na.pad=TRUE)
FluTest$ILILag2 = coredata(ILILag2Test)
summary(FluTest)
nrow(FluTrain)
FluTest$ILILag2[1] = FluTrain$ILI[416]
FluTest$ILILag2[2] = FluTrain$ILI[417]
FluTest$ILILag2[1]
FluTest$ILILag2[2]

PredTest2 = exp(predict(FluTrend2, newdata=FluTest))
rmse = sqrt(mean((FluTest$ILI - PredTest2)^2))
rmse
