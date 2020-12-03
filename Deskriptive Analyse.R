# remove all objects from workspace
rm(list = ls())
detach("package:moderndive", unload=TRUE)


# Install package moderndive that includes the dataset "house_prices" before adding the library
library(moderndive)
library(mosaic)

# add variables squaremeter to get a more intuitive understanding of the size
house_prices$sqmt_living <- house_prices$sqft_living*0.092903
house_prices$sqmt_living15 <- house_prices$sqft_living15*0.092903
house_prices$sqmt_lot <- house_prices$sqft_lot*0.092903
house_prices$sqmt_lot15 <- house_prices$sqft_lot15*0.092903
house_prices$sqmt_above <- house_prices$sqft_above*0.092903
house_prices$sqmt_basement <- house_prices$sqft_basement*0.092903

# attach the data to address the data in an easier way
attach(house_prices)


# Get a sample of records to look at
head(house_prices,10)

help(house_prices)
count(house_prices)

# Get an overview of the distribution of house prices
mean(price) # arithmetisches Mittel
median(price) # Median
max(price)
min(price)
t <- table(price) # Häufigkeitstabelle
t[which.max(t)] # Modus
summary(price)
#boxplot(price, data=house_prices,varwidth=TRUE)
#hist(price,xlim=c(0,1000000))

# Eine Übersicht der Verteilung der Hauspreise über die Dichtefunktion gewinnen
plot(density(price), main="Dichtefunktion: Hauspreise")
abline(0,0,0,321950) # add 1st Quartile
abline(0,0,0,645000) # add 3rd Quartile

# Dichtefunktion aufzeigen
plot(density(price), main="Dichtefunktion: Hauspreise",xlim=c(0,2000000),xlab="Hauspreis",xaxt="n") # change x axis limit to exclude high outliers from the plot
abline(0,0,0,321950) # add 1st Quartile
abline(0,0,0,645000) # add 3rd Quartile
?abline
axis(1,at=c(0,321950,500000,645000,1000000,1500000),labels=c(0,321950,500000,645000,1000000,1500000)) # add custom x Axis Values
text(380000,0.0000005,"- 1. Quartil")
text(710000,0.0000005,"- 3. Quartil")

# Globales Maximum innerhalb der Dichtefunktion => mean und median wahrscheinlich auch innerhalb Interquartilsabstand
# Dichtefunktion weist einen linksschiefen Verlauf aus. Das heißt median ist kleiner als das arithmetische Mittel


# looking at the 10 highest and lowest house prices
sort_price <- house_prices[order(price),]
head(sort_price$price,10)
tail(sort_price$price,10)


# Get an Overview of the dataset
inspect(house_prices)
# Obeservations: 
# 1) No data is missing
# 2) 5 Categorical variables, 1 date variable and 15 quantitative variables

# View dataset
View(house_prices)
# Observations:
# 1) 21.613 observations with 21 variables
# 2) bathrooms variable can be split to 1/4 
# 3) sqft_living15 & sqft_lot15 are the sizes at the time the house was sold. 
##   sqft_lot and sqft_living might be outdated in case renovation took place
# 4) Variable View unclear. Description: "Has been viewed". Values range between 0 and 4

summary(house_prices)
# Wieso hat sqmt_basement das Minimum, das erste Quartil und den Median = 0?
h <- hist(sqmt_basement,main="Kellergroesse",ylab="Anzahl",xlab="Kellergroesse in m²") 
text(h$mids,h$counts,labels=h$counts,adj=c(0.5,-0.5)) # Die meisten Häuser in King County, USA haben keinen Keller



