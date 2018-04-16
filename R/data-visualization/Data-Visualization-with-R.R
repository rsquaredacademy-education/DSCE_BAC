# load ggplot2 package
library(ggplot2)
library(readr)

# create coordinate system
ggplot()

# specify the data set 
ggplot(data = mtcars)

# geoms
# represent relationship using points
# map variables in the data to visual properties
# x axis represents vehicle displacement
# y axis represents mileage
ggplot(data = mtcars) + 
  geom_point(mapping = aes(x = disp, y = mpg))

ggplot(data = mtcars) +
  geom_histogram(mapping = aes(x = mpg))

ggplot(data = mtcars) +
  geom_boxplot(mapping = aes(x = cyl, y = mpg))

ggplot(data = mtcars) +
  geom_bar(mapping = aes(x = cyl))

# map aesthetics to variables
# color
# shape
# size
# background color
# transparency

# color of the point represents number of cylinders
ggplot(data = mtcars) + 
  geom_point(aes(x = disp, y = mpg, color = cyl))

# shape of the point represents gear
ggplot(data = mtcars) + 
  geom_point(aes(x = disp, y = mpg, shape = factor(gear)))

# size of the point represents weight
ggplot(data = mtcars) + 
  geom_point(aes(x = disp, y = mpg, size = wt))

# specify values for aesthetics
# color = blue
ggplot(data = mtcars) + 
  geom_point(aes(x = disp, y = mpg), color = "blue")

# shape = 3
ggplot(data = mtcars) + 
  geom_point(aes(x = disp, y = mpg), shape = 3)

# size = 2
ggplot(data = mtcars) + 
  geom_point(aes(x = disp, y = mpg), size = 2)


# transformations
# bar chart
ggplot(data = mtcars) +
  stat_count(mapping = aes(x = cyl))
# histograms
# box plots

# position of the geoms
ggplot(data = mtcars) +
  geom_bar(mapping = aes(x = cyl, fill = factor(gear)))

ggplot(data = mtcars) +
  geom_bar(mapping = aes(x = cyl, fill = factor(gear)), position = "dodge")

# coordinates
ggplot(data = mtcars) +
  geom_bar(mapping = aes(x = cyl, fill = factor(gear))) +
  coord_flip()


# facets
# split the plot into sub plots each of which 
# displays a subset of the data
# examine the relationship between disp and mpg for cyl
ggplot(data = mtcars) +
  geom_point(mapping = aes(x = disp, y = mpg)) +
  facet_wrap(~ cyl)

ggplot(data = mtcars) +
  geom_point(mapping = aes(x = disp, y = mpg)) +
  facet_grid(gear ~ cyl)


# title, axis labels & limits
ggplot(data = mtcars) + 
  geom_point(aes(x = disp, y = mpg), color = "blue") +
  labs(title = "mpg vs disp",
       x = "Displacement", y = "Miles Per Gallon")

ggplot(data = mtcars) + 
  geom_point(aes(x = disp, y = mpg), color = "blue") +
  ggtitle("mpg vs disp") +
  xlab("Displacement") + ylab("Miles Per Gallon")

# axis limits
ggplot(data = mtcars) +
  geom_point(aes(x = disp, x = mpg), color = "blue") +
  xlim(c(0, 600))

ggplot(data = mtcars) +
  geom_point(aes(x = disp, x = mpg), color = "blue") +
  ylim(c(0, 40))

ggplot(data = mtcars) +
  geom_point(aes(x = disp, x = mpg), color = "blue") +
  expand_limits(x = c(0, 600), y = c(0, 40))

# data -> geom -> coordinate -> facet
# geom -> map(x, y, color, fill, shape, stat, position)

# read data for line chart
# stock data for large cap companies
device <- read_csv("R/data-visualization/users_device.csv",
                   col_types = list(col_date(format = "%m/%d/%y"),
                                    col_integer(), col_integer(),
                                    col_integer()))
ggplot(data = device) +
  geom_line(mapping = aes(x = Date, y = Desktop))

ggplot(data = device) +
  geom_line(mapping = aes(x = Date, y = Desktop), color = "blue")

ggplot(data = device) +
  geom_line(mapping = aes(x = Date, y = Desktop), linetype = 2)

ggplot(data = device) +
  geom_line(mapping = aes(x = Date, y = Desktop), linetype = "dashed")

ggplot(data = device) +
  geom_line(mapping = aes(x = Date, y = Desktop), size = 2)

ggplot(data = device) +
  geom_line(mapping = aes(x = Date, y = Desktop)) +
  geom_line(mapping = aes(x = Date, y = Mobile))

ggplot(data = device) +
  geom_line(mapping = aes(x = Date, y = Desktop)) +
  geom_line(mapping = aes(x = Date, y = Mobile)) +
  geom_line(mapping = aes(x = Date, y = Tablet))

tidy_device <- read_csv("R/data-visualization/tidy_users.csv",
                        col_types = list(col_date(format = "%m/%d/%y"),
                                         col_character(), col_integer()))

ggplot(data = tidy_device) +
  geom_line(mapping = aes(x = Date, y = Users, group = Device, color = Device))
