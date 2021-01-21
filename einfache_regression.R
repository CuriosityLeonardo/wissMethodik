library(mosaic)

regression <- lm(price ~ sqmt_above, data = house_prices_sqmt)
summary(regression)
plotModel(regression)

regression2 <- lm(price ~ waterfront, data = house_prices_sqmt)
summary(regression2)
