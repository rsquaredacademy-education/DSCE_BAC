#-----------------------------------------------------------------------
# read data from flat/delimited files
#-----------------------------------------------------------------------

# load the readr package
library(readr)

# read data from the mtcars file
read_csv('data/mtcars.csv')

# read data from mtcars file using read_delim()
read_delim('data/mtcars.csv', delim = ",")

# read data from mtcars1.csv 
read_csv('data/mtcars1.csv')

# indicate that column names are absent
read_csv('data/mtcars1.csv', col_names = FALSE)

# read data from mtcars2.csv
read_csv('data/mtcars2.csv')

# instruct read_csv() to skip the first 19 lines in the file
read_csv('data/mtcars2.csv', skip = 19)

# instruct read_csv() to read the first 20 lines only
read_csv('data/mtcars.csv', n_max = 20)

# detect column types
spec_csv('data/mtcars5.csv')

# specify column types
read_csv('data/mtcars5.csv', 
         col_types = list(col_double(), col_factor(levels = c(4, 6, 8)),
                          col_double(), col_integer()))

# skip column
read_csv('data/mtcars5.csv', 
         col_types = list(col_double(), col_factor(levels = c(4, 6, 8)),
                          col_skip(), col_integer()))

# read data from 'mpg' and 'cyl' columns only
read_csv('data/mtcars5.csv', 
         col_types = cols_only(mpg = col_double(), 
                               cyl = col_factor(levels = c(4, 6, 8))))

#-----------------------------------------------------------------------
# read data from spreadsheets
#-----------------------------------------------------------------------

# load the readxl package
library(readxl)

# list all the sheets in the file
excel_sheets('data/sample.xls')

# read data from the first sheet
read_excel('data/sample.xls', sheet = 1)

# specify the range of the cells for reading data
read_excel('data/sample.xls', sheet = 1, range = "B1:C4")

# specify the column from which data must be read
read_excel('data/sample.xls', sheet = 1, range = cell_cols(2))

# specify the rows from which data must be read
read_excel('data/sample.xls', sheet = 1, range = cell_rows(1:4))

# specify the columns from which data must be read
read_excel('data/sample.xls', sheet = 1, range = cell_cols(2:3))

#-----------------------------------------------------------------------
# read data from other statistical software files
#-----------------------------------------------------------------------

# load the haven package
library(haven)

# read a stata file
read_stata('data/airline.dta')  

# read a spss file
read_spss('data/employee.sav') 

# read a sas file 
read_sas('data/airline.sas7bdat')

