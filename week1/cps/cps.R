CPS = read.csv('CPSData.csv')
nrow(CPS)

sort(table(CPS$Industry))
sort(table(CPS$State))

sum(CPS$Citizenship != 'Non-Citizen')/nrow(CPS)

str(CPS)

hisp = subset(CPS, CPS$Hispanic == 1)
table(hisp$Race)

summary(CPS)

table(CPS$Region, is.na(CPS$Married))
table(CPS$Sex, is.na(CPS$Married))
table(CPS$Age, is.na(CPS$Married))
table(CPS$Citizenship, is.na(CPS$Married))

table(CPS$State, is.na(CPS$MetroAreaCode))

table(CPS$Region, is.na(CPS$MetroAreaCode))

sort(tapply(is.na(CPS$MetroAreaCode), CPS$State, mean))

MetroAreaMap = read.csv('MetroAreaCodes.csv')
CountryMap = read.csv('CountryCodes.csv')

nrow(MetroAreaMap)
nrow(CountryMap)

CPS = merge(CPS, MetroAreaMap, by.x="MetroAreaCode", by.y="Code", all.x=TRUE)
str(CPS)
sum(is.na(CPS$MetroArea))

sort(table(CPS$MetroArea))
sort(tapply(CPS$Hispanic,CPS$MetroArea,mean))

sort(tapply(CPS$Race == 'Asian',CPS$MetroArea,mean))

sort(tapply(CPS$Education == "No high school diploma", CPS$MetroArea, mean, na.rm=TRUE))

CPS = merge(CPS, CountyMap, by.x="CountryOfBirthCode", by.y="Code", all.x=TRUE)
str(CPS)
sum(is.na(CPS$Country))

sort(table(CPS$Country))

subs = subset(CPS, MetroArea == 'New York-Northern New Jersey-Long Island, NY-NJ-PA' & !is.na(Country))
mean(subs$Country != 'United States')

sort(table(CPS[CPS$Country == 'India',]$MetroArea))
sort(table(CPS[CPS$Country == 'Brazil',]$MetroArea))
sort(table(CPS[CPS$Country == 'Somalia',]$MetroArea))
