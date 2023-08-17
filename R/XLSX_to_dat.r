rm(list = ls(all=TRUE))

library(readxl)
library (dplyr)

# reading the excel file





path <- './Clement_imo.xlsx'

sheetNames <- excel_sheets(path = path)

for (x in sheetNames) {
  
  xSheet <- read_excel(path, x )
  
  columnNam <- names(xSheet)
  
  columnNames <- columnNam[-1]
  
  for (i in columnNames) {
    
    variables <- c(columnNam[1], i)
    pattern <- xSheet %>%
      select (variables)
    i <- paste(i, '.dat', sep='')
    
    write.table(pattern, i, sep='\t', row.names = FALSE)
    
  }
  
}

# glimpse (xSheet)
# # 
# # pattern <- xSheet %>%
# #             select ('Angle', 'SF0005') %>%
# #             rename (Intensity = SF0005)
#   
# write.table(pattern, paste(i, '.dat', sep=''), sep='\t', row.names = FALSE)
# pattern


