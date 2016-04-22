data = read.csv("climate_change.csv")
str(data)
train = subset(data, Year <= 2006)
test = subset(data, Year > 2006)

model1 = lm(Temp ~ MEI + CO2 + CH4 + N2O + CFC.11 +
              CFC.12 + TSI + Aerosols, data=train)
summary(model1)
cor(train)

model2 = lm(Temp ~ MEI + N2O + TSI + Aerosols, data=train)
summary(model2)

model3 = step(model1)
summary(model3)

predicts = predict(model3, test)
summary(predicts)
predicts

# Compute R-squared
SSE = sum((test$Temp - predicts)^2)
SST = sum((test$Temp - mean(train$Temp))^2)
1 - SSE/SST
