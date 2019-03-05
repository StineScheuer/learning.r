# load package
source(here::here("R/package-loading.R"))

glimpse(NHANES)

NHANES <- NHANES
View(NHANES)

# Load the packages
library(tidyverse)
library(NHANES)

# eksempler på hvordan pipe operator bruges. En anden måde at kode på hvor man læser functionen
# fra venstre til højre i stedet for fra inside til outside

colnames(NHANES)
NHANES %>% colnames ()

glimpse(head(NHANES))

NHANES %>%
  head() %>%
  glimpse()


# vi laver en ny variabel for højde i meter i stedet for cm. Først laver vi et nyt dataset
# (nhanes_changed) som vi gemmer.

NHANES_CHANGED <- NHANES %>%
  mutate(Height_meters = Height/100)

# use condition to create a new variable
NHANES_CHANGED <- NHANES_CHANGED %>%
  mutate(HighlyActive = if_else(PhysActiveDays >= 5, "yes", "no"))

# create or replace multiple variables over time
NHANES_CHANGED <- NHANES_CHANGED %>%
  mutate(new_column = "only one variable",
         Height = Height/100,
         UrineVolAverage = (UrineVol1 + UrineVol2)/2)


# select() select specific data by the variable ---------------------------

NHANES_Characteristic <- NHANES %>%
  select(Age, Gender, BMI)

# to select similar names, use matching function
NHANES %>%
  select(starts_with("BP"), contains("Vol"))

# rename using the form: "newname = oldname"
NHANES %>%
  rename(NumberBabies = nBabies)


# filter () ---------------------------------------------------------------

#when gender is equal to
NHANES %>%
  filter(Gender == "female")

NHANES %>%
  filter(Gender != "female")

#When BMI is qual to 25

NHANES %>%
  filter(BMI == 25)

NHANES %>%
  filter(BMI >= 25)

# when BMI is 25 and gender is famale

NHANES %>%
  filter(BMI == 25 & Gender == "female")

NHANES %>%
  filter(BMI == 25  | Gender == "female")


# arrange(): sort/rearrange by coloum -------------------------------------

#ascending order
NHANES %>%
  arrange(Age) %>%
  select(Age)

#descending order

NHANES %>%
  arrange(desc(Age)) %>%
  select(Age)

#ascending order more variable
NHANES %>%
  arrange(Age, Gender) %>%
  select(Age, Gender)


# group_by and summerise ---------------------------------------------------

#na.rm stpr for missing remove, når den sættes til true fjernes disse. Den er nødvendig for at et mean udregnes

NHANES %>%
  summarise(MaxAge = max(Age, na.rm = TRUE),
            MeanBMI = mean(BMI, na.rm = TRUE))

# combine with group_by

NHANES %>%
  group_by(Gender) %>%
  summarise(MaxAge = max(Age, na.rm = TRUE),
            MeanBMI = mean(BMI, na.rm = TRUE))

NHANES %>%
  group_by(Gender, Diabetes) %>%
  summarise(MaxAge = max(Age, na.rm = TRUE),
            MeanBMI = mean(BMI, na.rm = TRUE))


# gather(): converting from wide to long form -----------------------------

table4b

table4b %>%
  gather(key = year, value = population, -country)

table4b %>%
  gather(key = year, value = population, `1999`, `2000`)

# keep only  variables of interest

nhanes_char <- NHANES %>%
  select(SurveyYr, Gender, Age, Weight, Height, BMI, BPSysAve)
nhanes_char

nhanes_long <- nhanes_char %>%
  gather(Measure, Value, -SurveyYr, -Gender)

nhanes_long

#calculate mean

nhanes_long %>%
  group_by(SurveyYr, Gender, Measure) %>%
  summarise(MeanValues= mean(Value, na.rm = TRUE))

?gather
