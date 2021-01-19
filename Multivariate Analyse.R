# Source: https://rstudio-pubs-static.s3.amazonaws.com/155304_cc51f448116744069664b35e7762999f.html

# remove all objects from workspace

rm(list = ls())
detach("package:moderndive", unload=TRUE)


# Install package moderndive that includes the dataset "house_prices" before adding the library

#Install and Call Package moderndive that includes the dataset "house_prices"
library(moderndive)
#Install and call Package mosaic for descriptive Analysis
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
summary(house_prices_sqmt)

### Analyse independent variables with dependent variable price in a 2 dimensional linear regression (p.81-82)
# smqt_living15 and price
cor(price,sqmt_living15) # 0.5853789
sd(price) # 367127.2
sd(sqmt_living15) # 63.67491
Regressionsgewicht_price_sqmt_living15 <- cor(price,sqmt_living15) * (sd(price)/sd(sqmt_living15))
Regressionsgewicht_price_sqmt_living15 # 3375.09
# Interpretation: Mit jedem zusätzlichen m² Wohnfläche, steigt der Preis eines Hauses um 3375.09 Dollar
Intercept_price_sqmt_living15 <- mean(price) - Regressionsgewicht_price_sqmt_living15 * mean(sqmt_living15)
Intercept_price_sqmt_living15
# Interpretation: Wenn die Wohnfläche bis auf 0m² reduziert worden wäre, würde das Haus -82807.2 Dollar kosten
lm(data=house_prices_sqmt,price~sqmt_living15)

summary(lm(data=house_prices_sqmt,price~date))

summary(lm(data=house_prices_sqmt,price~bathrooms))


#is not running because it takes too much compute power (too many variables and observations)
#regression <- step(lm(data = house_prices_sqmt,price~.),trace=1,steps=2)

## Ecample for Step Regression with all the available Variables
# regression <- step(lm(data = swiss,Fertility~.),trace=1,steps=2)
#summary(regression)

help("house_prices")

backward_regression <- step(lm(data=house_prices_sqmt,price~zipcode),direction="backward")
summary(backward_regression)


# Wähle die Variablen, die zur Multiplen, linearen Regression verwendet werden sollen
house_prices_sqmt_r <- subset(house_prices, select =  c(price,
                                                        bedrooms,
                                                        bathrooms,
                                                        sqmt_living15,
                                                        sqmt_lot15,
                                                        floors,
                                                        sqmt_above,
                                                        sqmt_basement,
                                                        yr_built,
                                                        yr_renovated
                                                        ))


detach(house_prices_sqmt)
attach(house_prices_sqmt_r)
inspect(house_prices_sqmt_r)

summary(step(lm(data=house_prices_sqmt_r,price~.)))

# Korrelationsmatrix von house_prices_sqmt_r erstellen um auf Multikolinearität zu prüfen
cor(house_prices_sqmt_r)

korr_hp <- cor(house_prices_sqmt_r)
korr_hp

manual_regression <- lm(data=house_prices_sqmt_r,price~
                                                      bedrooms
                                                      +bathrooms
                                                      +sqmt_living15
                                                      +sqmt_lot15
                                                      +floors
                                                      +sqmt_basement
                                                      +yr_built
                                                      +yr_renovated)
summary(manual_regression)

step_forward <- step(lm(data=house_prices_sqmt_r,price~
                     bedrooms
                   +bathrooms
                   +sqmt_living15
                   +sqmt_lot15
                   +floors
                   +sqmt_basement
                   +yr_built
                   +yr_renovated),direction="forward")
summary(step_forward)

step_backward <- step(lm(data=house_prices_sqmt_r,price~
                          bedrooms
                        +bathrooms
                        +sqmt_living15
                        +sqmt_lot15
                        +floors
                        +sqmt_basement
                        +yr_built
                        +yr_renovated),direction="backward",trace=0)
summary(step_backward)

step_both <- step(lm(data=house_prices_sqmt_r,price~
                           bedrooms
                         +bathrooms
                         +sqmt_living15
                         +sqmt_lot15
                         +floors
                         +sqmt_basement
                         +yr_built
                         +yr_renovated),direction="both",trace=0)
summary(step_both)



step_regression <- step(lm(data=house_prices_sqmt,price~bedrooms+bathrooms+floors+yr_built+yr_renovated+sqmt_living15+sqmt_lot15+sqmt_above+sqmt_basement),direction="forward")
summary(step_regression)
summary(manual_regression)





# Prüfe Variablen auf Multikollinearität
cor(sqmt_living,sqmt_living15)
cor(sqmt_living,price)
cor(bathrooms,bedrooms)

summary(lm(data=house_prices_sqmt,bedrooms~bathrooms))

