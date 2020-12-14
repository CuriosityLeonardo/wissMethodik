# remove all objects from workspace

# Source: https://rstudio-pubs-static.s3.amazonaws.com/155304_cc51f448116744069664b35e7762999f.html

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

# drop the variables with sqft
house_prices_sqmt <- subset(house_prices, select = -c(sqft_living,
                                                      sqft_living15,
                                                      sqft_lot,
                                                      sqft_lot15,
                                                      sqft_above,
                                                      sqft_basement))

# attach the data to address the data in an easier way
attach(house_prices_sqmt)



inspect(house_prices_sqmt)


regression <- step(lm(data = house_prices_sqmt,price~.),trace=1,steps=2)

regression <- step(lm(data = swiss,Fertility~.),trace=1,steps=2)

summary(regression)


backward_regression <- step(lm(data=house_prices_sqmt,price~zipcode),direction="backward")
summary(backward_regression)
?step

