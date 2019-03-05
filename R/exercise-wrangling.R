# Load the packages
library(tidyverse)
library(NHANES)


# Exercise 1 --------------------------------------------------------------



# Check column names
colnames(NHANES)

# Look at contents
str(NHANES)
glimpse(NHANES)

# See summary
summary(NHANES)

# Look over the dataset documentation
?NHANES


# Exercise 2 --------------------------------------------------------------



# Check the names of the variables
colnames(NHANES)

# Pipe the data into mutate function and:
NHANES_modified <- NHANES %>% # dataset
  mutate(
    # 1. Calculate average urine volume
    UrineVolAverage = (UrineVol1 + UrineVol2)/2,
    # 2. Modify Pulse variable
    Pulse = Pulse*60,
    # 3. Create YoungChild variable using a condition
    YoungChild = if_else(Age < 6, "yes", "no"))


# Exercise 2 --------------------------------------------------------------

# To see values of categorical data
summary(NHANES)

# 1. BMI between 20 and 40 and who have diabetes
NHANES %>%
  # format: variable >= number
  filter(BMI > 20 & BMI < 40 & Diabetes == "Yes")

# 2. Working or renting, and not diabetes
NHANES %>%
  filter(Work == "Working" | HomeOwn == "Rent" & Diabetes == "No") %>%
  select(Age, Gender, Work, HomeOwn, Diabetes)

# 3. How old is person with most number of children.
NHANES %>%
  arrange(nBabies) %>%
  select(Age)
