# Global-MPI-2020-Dashboard

Test creating a flexdashboard for the Global MPI data released by OPHI.

## Data Source 

The data used for for this dashboard is from [OPHI - Global MPI data tables 2020](https://ophi.org.uk/multidimensional-poverty-index/data-tables-do-files/). We are using the __Table 1 - National Results MPI 2020__.

The __National Results MPI 2020__ is available as an excel workbook with mutlilple sheets. For this dashboard we shall be using the following sheets from the workbook:  

  * 1.1 National MPI Results
  * 1.2 Censored Headcounts
  * 1.3 Contributions of Deprivations
  

## Data cleaning

The tables from the three sheets will be cleaned and mereged into a single table. This will be done by a script named `cleaning_data.R`.

The new merged data will be saved in the `data` folder by the name `clean_global_2020_mpi_data.csv`

## Link to dashboard

This is the [Link](https://ayush-patel.shinyapps.io/Global_MPI_2020/) to the dashboard.

Deployed for the first time on 16/08/2020.


