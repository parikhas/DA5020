library(nycflights13)
library(tidyverse)
library(ggplot2)
surveys <- read.csv("surveys.csv", header = T, sep = ",") 
View(surveys)
install.packages("gapminder")
library(gapminder)

#1. Write R code to extract the survey observations for the first three months of 1990 using the filter() function. (5 points)
f <- filter(surveys, year == "1990")
m <- filter(f, month %in% c("1","2","3"))
m
View(m)

*** surveys %>% filter((year = "1990") %>% (month %in% c("1","2","3")))

#2. Sort the 1990 winter surveys data by descending order of record ID, then by ascending order of weight.  (10 points)
arrange(f, desc(record_id))
arrange(f, weight)
*** winter???

#3. Write code that returns the record_id, sex and weight of all surveyed individuals of Reithrodontomys montanus (RO), (10 points)
f1 <- filter(surveys, species_id == "RO")
f1
select(f1, record_id, sex, weight, species_id)

*** f2 %>% (species_id = "RO") %>% (record_id) %>% (sex) %>% (weight)

#4. Write code that returns the average weight and hindfoot length of Dipodomys merriami (DM) individuals observed in each month (irrespective of the year). Make sure to exclude NA values. (10 points)
summarize(surveys, weight_mean = mean(weight, na.rm = T), hindfoot_length_mean = mean(hindfoot_length, na.rm = T))

#5. Write  code that determines the number of individuals by species observed in the winter of 1990. (15 points)
Groups <- summarize(group_by(surveys, species_id, num_individuals =n()))
View(Groups)
*** winter???

#6. Create a dataframe named gapminder_df and mutate it to contain a column that contains the gross domestic product for each row in the data frame. (5 points)
gapminder_df <- as.data.frame(gapminder)
View(gapminder_df)
gapminder_df_GDP <- mutate(gapminder_df, GDP = pop*gdpPercap)

#7. Calculate the Mean GDP for Cambodia for the years within the dataset. (15 points)
summarize(gapminder_df_GDP, country = "Cambodia", mean_GDP = mean(GDP))

#8. Find the year with the maximum life expectancy for countries in Asia and arrange them in descending order by year,  The result should contain the country’s name, the year and the life expectancy.  (15 points)
fil1 <- filter(gapminder_df, year == "2007")
fil2 <- filter(fil1, continent == "Asia")
select(fil2, country, year, lifeExp)

*** a <- arrange(gapminder_df, desc(lifeExp)) %>%
View(a)

gapminder_df %>% filter(year == "2007") %>% filter(continent == "Asia") %>% filter(lifeExp)

#9. Count the number of observations per continent. (5 points)
obs_per_cont <- summarize(group_by(gapminder_df, continent, num_obs =n()))
View(obs_per_cont)

#10.  Compute the average and median life expectancy and GDP per capita by continent for the years 1952 and 2007.  Should we be optimistic given the results? (10 points)
Avg <- summarize(group_by(gapminder, continent, mean_lifeExp = mean(lifeExp), med_lifeExp = median(lifeExp), year))
View(Avg)
fil <- filter(Avg, year %in% c("1952", "2007"))
group_by(fil, year)


