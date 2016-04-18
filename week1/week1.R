USDA = read.csv("USDA.csv")
str(USDA)
summary(USDA)
which.max(USDA$Sodium)
names(USDA)
USDA$Description[265]
HighSoidum = subset(USDA, Sodium>10000)
nrow(HighSoidum)
match("CAVIAR", USDA$Description)
USDA$Sodium[4154]
USDA$Sodium[match("CAVIAR", USDA$Description)]
summary(USDA$Sodium)
sd(USDA$Sodium, na.rm=TRUE)

USDA$HighSoidum = USDA$Sodium > mean(USDA$Sodium, na.rm=TRUE)
table(USDA$HighSoidum)
USDA$HighFat = USDA$TotalFat > mean(USDA$TotalFat, na.rm=TRUE)
table(USDA$HighSoidum, USDA$HighFat)

USDA$HighProtein = as.numeric(USDA$Protein > mean(USDA$Protein, na.rm=TRUE))

tapply(USDA$Iron, USDA$HighProtein, mean, na.rm=TRUE)
