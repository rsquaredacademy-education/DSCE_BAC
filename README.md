
DSCE Business Analytics Conclave Workshop
-----------------------------------------

19th, 20th & 21st April, 2pm - 5pm

If you run into issues while installing the softwares required for the workshop, please reach out to us @ <rsquaredin@gmail.com> or 7259970037.

Introduction
------------

Materials for the workshop. Please install all the required softwares and download the data sets and scripts from this repository before the workshop. **The final version of the materials will be available by 6 PM Wednesday (18/04/2018). Please ensure that you download them before coming to the workshop.**

-   [Workshop Material Download Demo](https://vimeo.com/265157284)

Software Prerequisites
----------------------

### R

R can be installed from the R project [website](https://cran.r-project.org/). Please install the latest version 3.4.4.

-   [R Download Demo](https://vimeo.com/265157309)
-   [R Installation Demo](https://vimeo.com/265157340)

Download and install Rtools from [here](http://cran.us.r-project.org/bin/windows/Rtools/).

### RStudio

RStudio IDE can be installed from the RStudio [website](https://www.rstudio.com/products/rstudio/download/). Install the free desktop version.

-   [RStudio Download Demo](https://vimeo.com/265158190)
-   [RStudio Installation Demo](https://vimeo.com/265157379)

### R Packages

Below are a list of R packages required for the workshop:

#### First Day

-   readr
-   readxl
-   haven
-   dplyr
-   ggplot2
-   magrittr
-   descriptr
-   skimr

#### Second Day

-   inferr
-   olsrr
-   blorr
-   rmarkdown
-   knitr
-   devtools
-   forcats
-   caret

Once you download the workshop materials, run the script (`package_download.R`) in the `R` folder to download the above packages as shown in the below video:

-   [R Packages Installation Demo](https://vimeo.com/265157256)

To test if a package has been correctly installed or not, type `library(packagename)` in the RStudio console. For example, to test if **readr** package has been installed, type `library(readr)` in the RStudio console. If the package has not been installed correctly, you will get the following error message:

`Error in library(readr) : there is no package called ‘readr’`

There will be no error message if the package has been correctly installed.

### Anaconda

Download and install the Anaconda distribution from their [website](https://www.anaconda.com/download/). We will use [Jupyter Notebook](http://jupyter.org/) for the python session.

-   [Anaconda Download Demo](https://vimeo.com/265158166)
-   [Anaconda Installation Demo](https://vimeo.com/265157200)

After installing the Anaconda distribution for Python, open the Command Prompt (type cmd) or Windows Powershell (type powershell) and type `jupyter notebook`.

-   [Jupyter Notebook Demo](https://vimeo.com/265161739)

R Session
---------

-   Quick tour of R & RStudio
-   Importing data into R
-   Data Wrangling
-   Data Visualization
-   Exploratory Data Analysis
-   Linear Regression
-   Logistic Regression

Python Session
--------------

-   Data Wrangling with Pandas
-   Data Visualization
    -   matplotlib
    -   bokeh
    -   plotly
-   Modeling with statsmodels

Useful Resources
----------------

-   [Rstudio Webinars](https://www.rstudio.com/resources/webinars/)
-   [RStudio Cheat Sheets](https://www.rstudio.com/resources/cheatsheets/)
-   [tidyverse](https://www.tidyverse.org/)
-   [R Bloggers](https://www.r-bloggers.com/)
-   [R Weekly](https://rweekly.org/)
