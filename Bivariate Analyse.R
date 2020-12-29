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

# Perform t Test on dependent variable price and independent variable sqft_living15
#t.test(price,sqft_living15) # Output saved in "Forschungsfrage.docx" in section "Nullhypothese 1"

regression1 <- lm(data = house_prices_sqmt,price~sqmt_living15)
summary(regression1)

regression1 <- lm(data = house_prices_sqmt,price~sqmt_lot15)
summary(regression1)

regression1 <- lm(data = house_prices_sqmt,price~long)
summary(regression1)


# Perform t Test on dependent variable price and independent variable sqft_lot15
t.test(price,sqft_lot15) # Output saved in "Forschungsfrage.docx" in section "Nullhypothese 2"

# Perform t Test on dependent variable price and independent variable bedrooms
t.test(price,bedrooms,data = house_prices) # Output saved in "Forschungsfrage.docx" in section "Nullhypothese 3.1"

# Perform t Test on dependent variable price and independent variable bathrooms
t.test(price,bathrooms,data=house_prices) # Output saved in "Forschungsfrage.docx" in section "Nullhypothese 3.2"

# Perform t Test on dependent variable price and independent variable floors
t.test(price,floors,data=house_prices) # Output saved in "Forschungsfrage.docx" in section "Nullhypothese 3.2"


summary(house_prices_sqmt)

install.packages("corrplot")
library(corrplot)

subset_house_prices_sqmt <- subset(house_prices, select = c(price,
                                                            bedrooms,
                                                            bathrooms,
                                                            floors,
                                                            view,
                                                            yr_built,
                                                            yr_renovated,
                                                            lat,
                                                            long,
                                                            sqmt_living,
                                                            sqmt_living15,
                                                            sqmt_lot,
                                                            sqmt_lot15,
                                                            sqmt_above,
                                                            sqmt_basement))

?subse

cor_matrix <- cor(subset_house_prices_sqmt[1:15])

cor(subset_house_prices_sqmt[1:15])
cor(lat,price)
cor(price,bathrooms)

corrplot(cor_matrix,type="upper")

inspect(house_prices_sqmt)
View(house_prices_sqmt)

?cor




