pisaTrain = read.csv("pisa2009train.csv")
pisaTest = read.csv("pisa2009test.csv")

str(pisaTrain)
tapply(pisaTrain$readingScore, pisaTrain$male, mean)
summary(pisaTrain)

pisaTrain = na.omit(pisaTrain)

pisaTest = na.omit(pisaTest)

str(pisaTrain)
str(pisaTest)

pisaTrain$raceeth = relevel(pisaTrain$raceeth, "White")
pisaTest$raceeth = relevel(pisaTest$raceeth, "White")

model1 = lm(readingScore ~ ., data=pisaTrain)
summary(model1)
predicts = predict(model1, pisaTrain)
rmse = sqrt(mean((pisaTrain$readingScore - predicts)^2))
rmse

predicts2 = predict(model1, pisaTest)
summary(predicts2)

# Compute R-squared
SSE = sum((pisaTest$readingScore - predicts2)^2)
SSE
rmse = sqrt(mean((pisaTest$readingScore - predicts2)^2))
rmse
mean(pisaTrain$readingScore)
SST = sum((pisaTest$readingScore - mean(pisaTrain$readingScore))^2)
SST
1 - SSE/SST
