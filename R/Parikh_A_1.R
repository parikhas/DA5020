install.packages("tidyverse")
library("tidyverse")
library(ggplot2)

#1
?mtcars
# The gear variable describes the number of forward gears.

#2
ggplot(data = mtcars) + 
  geom_point(mapping = aes(x = mpg, y = cyl))

#3
?mtcars
mtcars
# The categorical variables are cyl, vs, am, gear and carb. 
# The continuos variables are mpg, disp, hp, drat, wt and qsec.

#4
ggplot(data = mtcars) +
  geom_point(mapping = aes(x = disp, y = mpg)) +
  facet_grid(cyl ~ .)
# This creates a scatterplot of the displacement vs miles per gallon in facets. The ggplot is faceted on the number of cylinders.  
# It shows the relationship of displacement with miles per gallon as the number of cylinders changes.

ggplot(data = mtcars) +
  geom_point(mapping = aes(x = disp, y = mpg)) +
  facet_grid(. ~ am)
# This creates a scatterplot of the displacement vs mile per gallon in facets. The ggplot is faceted on transmission.
# It shows the relationship of displacement with miles per gallon as the transmission changes.

# . acts a placeholder for no variable. In facet_grid(), this results in a plot faceted on a single dimension (1 by NN or NN by 1) rather than an NN by NN grid.

#5
?facet_wrap

# nrow is an argument which specifies the number of rows to be used for facets
# ncol is an argument which specifies the number of column to be used for facets 
# The other options which control the layout of the individual panels are as.table and dir
# facet_grid() doesn't have nrow and ncol argument because it has rows and columns inbuilt in the function. 
# facet_grid forms a matrix of panels defined by row and column facetting variables.

#6

# I predict that the following code will create a ggplot of disp vs mpg with respect to cyl. 
# geom_point will create a scatterplot(with blue points) of the same and geom_smooth will draw a line, for each unique value of the variable
ggplot(data = mtcars, mapping = aes(x = disp, y = mpg, color = cyl)) + 
geom_point() + 
geom_smooth(se = FALSE)

# Once we run the code, we see that it does as in predicted. 
# One more detail is seen that points on the ggplot are of different shades of blue depending on the number of cylinders.
# Higher the number, lighter the shade and vice versa.

#7
ggplot(data = mtcars) + 
  stat_summary(
    mapping = aes(x = disp, y = mpg),
    fun.ymin = min,
    fun.ymax = max,
    fun.y = median
  )
# The default geom associated with stat_summary() is geom_pointrange
# Rewritten code is as follows:
ggplot(data = mtcars) + 
  geom_pointrange(
    mapping = aes(x = disp, y = mpg),
    stat = "summary",
    fun.ymin = min,
    fun.ymax = max,
    fun.y = median
  )

#8 
ggplot(data = mpg, mapping = aes(x = cty, y = hwy)) +
  geom_point()

ggplot(data = mpg, mapping = aes(x = cty, y = hwy)) +
  geom_jitter()

ggplot(data = mpg, mapping = aes(x = cty, y = hwy)) +
  geom_count()

# geom_jitter() adds a small amount of random noise to each point. 
# This spreads the points out because no two points are likely to receive the same amount of random noise.
# geom_count() counts the number of observations at each location, then maps the count to point area.
# More the observations at an area, larger the size of points on the plot

#9
ggplot(data = mpg, mapping = aes(x = cty, y = hwy)) +
  geom_point() + 
  geom_abline() +
  coord_fixed()
# The relationship between cty and hwy in mpg is mostly linear.
# The cars have a slightly better highway mileage than city mileage.
# coord_fixed() is important because using it, the plot makes equal intervals on the x and y axes. Thus they can be directly compared.
# geom_abline() draws a line that has an intercept of 0 and slope of 1.

#10 is in a different file






