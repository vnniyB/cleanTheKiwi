##Retrieve gitToken @ https://github.com/settings/applications#personal-access-tokens
source("http://www.bioconductor.org/biocLite.R")

install.packages("RODBC")
install.packages("RCurl")
install.packages("gdata")
install.packages("devtools")
install.packages("kinship2")
install.packages("ggplot2")
install.packages("dplyr")
install.packages("tidyr")
install.packages("data.table")
install.packages("shiny")

devtools::install_github(repo="PlantandFoodResearch/PAAUtils", ref="master", auth_token=gitToken)
devtools::install_github(repo="PlantandFoodResearch/PFRBreedR", ref="master", auth_token=gitToken)

devtools::install_github("rstudio/DT")
