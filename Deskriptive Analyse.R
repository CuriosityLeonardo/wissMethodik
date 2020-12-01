# Install package moderndive that includes the dataset "house_prices" before adding the library
library(moderndive)
library(mosaic)



# attach the data to address the data in an easier way
attach(house_prices)

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

