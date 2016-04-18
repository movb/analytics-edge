crimes <- read.csv("mvtWeek1.csv")
nrow(crimes)
ncol(crimes)
summary(crimes)
str(crimes)
max(crimes$ID)
min(crimes$Beat)
sum(crimes$Arres == TRUE)
nrow(subset(crimes, crimes$LocationDescription == 'ALLEY'))
crimes$Date[10000]

DateConvert = as.Date(strptime(crimes$Date, "%m/%d/%y %H:%M"))
median(DateConvert)

crimes$Month = months(DateConvert)
crimes$Weekday = weekdays(DateConvert)
crimes$Date = DateConvert
table(crimes$Month)
table(crimes$Weekday)
table(crimes$Month, crimes$Arrest)
hist(crimes$Date, breaks=100)
boxplot(crimes$Date ~ crimes$Arrest)
table(crimes$Year, crimes$Arrest)
2152/(18517+2152)
1212/(13068+1212)
550/(13542+550)

sort(table(crimes$LocationDescription))
Top5 = subset(crimes, LocationDescription=='STREET' |
                      LocationDescription=='PARKING LOT/GARAGE(NON.RESID.)' |
                LocationDescription=='ALLEY' |
                LocationDescription=='GAS STATION' |
                LocationDescription=='DRIVEWAY - RESIDENTIAL')
nrow(Top5)

Top5$LocationDescription = factor(Top5$LocationDescription)

table(Top5$LocationDescription, Top5$Arrest)

gs = subset(Top5, LocationDescription=='GAS STATION')
table(gs$Weekday)
rd = subset(Top5, LocationDescription=='DRIVEWAY - RESIDENTIAL')
table(rd$Weekday)
