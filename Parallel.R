##### The aim of this script is to load simple-process and save a large file. 
# in this case 5GB csv, zipped as 515MB file.
# First commit locally, then push to the repository.

library(data.table)
library(bit64)


## DETERMINE the number of rows in a csv file, without loading in memory.
testcon <- file("diameter_18_prb_MIVDJ03B_ipx_reports_data_1462806000_900_0_3.csv",open="r")
readsizeof <- 20000
nooflines <- 0
( while((linesread <- length(readLines(testcon,readsizeof))) > 0 ) 
  nooflines <- nooflines+linesread )
close(testcon)
nooflines
# diameter is 8.5M rows.


# Read 10 rows from the .zip file as data.frame or data.table.
system.time(data <- read.csv(unzip("diameter_18_prb_MIVDJ03B_ipx_reports_data_1462806000_900_0_3.zip"), nrows = 10))
#user  system elapsed 
#42.96   16.67  107.66 
system.time(data <- fread(unzip("diameter_18_prb_MIVDJ03B_ipx_reports_data_1462806000_900_0_3.zip"), nrows=10))
#user  system elapsed 
#41.76   15.08  100.82 

# Read 10000 rows from the .zip file as data.frame or data.table.
system.time(data <- read.csv(unzip("diameter_18_prb_MIVDJ03B_ipx_reports_data_1462806000_900_0_3.zip"), nrows = 10000))
#user  system elapsed 
#45.35   15.98  148.52
system.time(data <- fread(unzip("diameter_18_prb_MIVDJ03B_ipx_reports_data_1462806000_900_0_3.zip"), nrows=10000))
#user  system elapsed 
#42.81   17.04  113.74 




