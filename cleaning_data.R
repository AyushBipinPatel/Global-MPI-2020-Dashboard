############################ cleaning data#####################################

# Breaking all copy paste rules by Hadley Wickham


# libraries ---------------------------------------------------------------

library(here)
library(tidyverse)
library(readxl)
library(janitor)

# Importing data ----------------------------------------------------------

sheet1 <- read_xlsx(sheet = 1,
                    path = here("data","data_ophi_global_2020.xlsx"),
                    col_names = FALSE, 
                    skip = 8)

sheet2 <- read_xlsx(sheet = 2,
                    path = here("data","data_ophi_global_2020.xlsx"),
                    col_names = FALSE, 
                    skip = 8)

sheet3 <- read_xlsx(sheet = 3,
                    path = here("data","data_ophi_global_2020.xlsx"),
                    col_names = FALSE, 
                    skip = 8)


# Keeping relevant rows and columns ---------------------------------------

## Sheet 1-----------------------------------------

sheet1 <- sheet1[1:107,c(1:4,7:11,15,18)]

## Sheet 2---------------------------------------

sheet2 <- sheet2[,c(1,8:17)]

## Sheet 3--------------------------------------

sheet3 <- sheet3[,c(1,8:20)]


# Giving proper column names ----------------------------------------------

sheet1_names <- c(
  "iso_country_numeric_code",
  "iso_country_code",
  "country",
  "world_region",
  "MPI_0_to_1",
  "pct_pop_headcountratio",
  "pct_intensity",
  "pct_pop_vulnerable_to_poverty",
  "pct_pop_in_severe_poverty",
  "tot_pop_K",
  "num_mpi_poor_people_K"
)

sheet2_names <- c(
  "iso_country_numeric_code",
  "pct_pop_nutrition",
  "pct_pop_child_mortality",
  "pct_pop_years_of_schooling",
  "pct_pop_school_attendance",
  "pct_pop_cooking_fuel",
  "pct_pop_sanitation",
  "pct_pop_drinking_water",
  "pct_pop_electricity",
  "pct_pop_housing",
  "pct_pop_assests"
)


sheet3_names <- c(
  "iso_country_numeric_code",
  "pct_contri_health",
  "pct_contri_education",
  "pct_contri_living_standards",
  "pct_contri_nutrition",
  "pct_contri_child_mortality",
  "pct_contri_years_of_schooling",
  "pct_contri_school_attendance",
  "pct_contri_cooking_fuel",
  "pct_contri_sanitation",
  "pct_contri_drinking_water",
  "pct_contri_electricity",
  "pct_contri_housing",
  "pct_contri_assests"
)


colnames(sheet1) <- sheet1_names

colnames(sheet2) <- sheet2_names

colnames(sheet3) <- sheet3_names


# Merging the data tables -------------------------------------------------

sheet1$iso_country_numeric_code <- as.numeric(sheet1$iso_country_numeric_code)

merged_data <- sheet1 %>% 
                left_join(sheet2,by= "iso_country_numeric_code") %>% 
                left_join(sheet3, by = "iso_country_numeric_code") 


# writing the clean data --------------------------------------------------

write_csv(merged_data,
          here("data","clean_global_2020_mpi_data.csv"))


######################################### All Done ###############################################




