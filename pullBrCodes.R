library(RODBC)
library(gdata)
library(XLConnect)

dir          <- "//iplant.pfr.co.nz/projects/010009/Kiwifruit/"
dir.contents <- list.files(dir)
dir.contents.crossingfiles <- dir.contents[grep('Crossing',dir.contents)]
if(DEBUG){
  x <- dir.contents.crossingfiles
  i <- 1
  j <- 1
}

##Read 2012 crossig file
fileN <- dir.contents.crossingfiles[1]
file <- paste0(dir,fileN)
XlsConnection <- odbcConnectExcel2007(file)
SensoryTables <- sqlTables(XlsConnection)
tabList <- SensoryTables
SensoryTables$TABLE_NAME
crossing2012_Pnorth <- sqlFetch(XlsConnection, "Pnorth")
crossing2012 <- sqlFetch(XlsConnection, "Crossing List 2012")

#Read 2013 crossing file
fileN <- dir.contents.crossingfiles[4]
file <- paste0(dir,fileN)
XlsConnection <- odbcConnectExcel2007(file)
SensoryTables <- sqlTables(XlsConnection)
tabList <- SensoryTables
SensoryTables$TABLE_NAME
crossing2013_All <- sqlFetch(XlsConnection, "All Crosses")
crossing2013 <- sqlFetch(XlsConnection, "Sheet1")
crossing2013_Pollinizers <- sqlFetch(XlsConnection, "Pollinizers")


readFromiPlantOdbc <- function(x, dir){
  for(i in 1:length(x)){
    file <- paste0(dir,x[i])
    XlsConnection <- odbcConnectExcel2007(file)
    SensoryTables <- sqlTables(XlsConnection)
    tabList <- SensoryTables
    SensoryTables$TABLE_NAME
    crossing2012_Pnorth <- sqlFetch(XlsConnection, "Pnorth")
    crossing2012_ <- sqlFetch(XlsConnection, "Crossing List 2012")
    
{
#     for(j in 1:length(tabList)){
#       try(data <- sqlFetch(XlsConnection, gsub("\'","",tabList$TABLE_NAME[j])), silent = TRUE)
#         assign(paste(file,tabList$TABLE_NAME[j]), data)
#     }
}
    odbcCloseAll()
  }
}

readFromiPlant(dir.contents.crossingfiles, dir)

readFromiPlantGdata <- function(x, dir){
  for(i in 1:length(x)){
    file <- paste0(dir,x[i])
    list <- sheetCount(file)
    tabList <<- sheetNames(file)
    for(j in list){
    try(assign(paste(c(file,sList[j]),collapse = "_"), read.xls(file, sheet = j)),silent=TRUE)
  }
}
}

readFromiPlantXLCon <- function(x, dir){
  for(i in 1:length(x)){
    file <- paste0(dir,x[i])
    wb <- loadWorkbook(file)
    XlsConnection <- odbcConnectExcel2007(file)
    SensoryTables <- sqlTables(XlsConnection)
    tabList <- SensoryTables
    for(j in 1:length(tabList)){
      try(assign(paste(file,tabList$TABLE_NAME[j],collapse = "_"), readWorksheet(wb, sheet = j)),silent=TRUE)
    }
  }
}

readFromiPlantXLCon(dir.contents.crossingfiles, dir)
