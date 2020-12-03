# Install package moderndive that includes the dataset "house_prices" before adding the library
library(moderndive)
library(mosaic)

# attach the data to address the data in an easier way
attach(house_prices)

# Perform t Test on dependent variable price and independent variable sqft_living15
t.test(price,sqft_living15) # Output saved in "Forschungsfrage.docx" in section "Nullhypothese 1"

# Perform t Test on dependent variable price and independent variable sqft_lot15
t.test(price,sqft_lot15) # Output saved in "Forschungsfrage.docx" in section "Nullhypothese 2"

# Perform t Test on dependent variable price and independent variable bedrooms
t.test(price,bedrooms,data = house_prices) # Output saved in "Forschungsfrage.docx" in section "Nullhypothese 3.1"

# Perform t Test on dependent variable price and independent variable bathrooms
t.test(price,bathrooms,data=house_prices) # Output saved in "Forschungsfrage.docx" in section "Nullhypothese 3.2"

