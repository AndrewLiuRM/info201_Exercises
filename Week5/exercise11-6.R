# Exercise 6: dplyr join operations

# Install the `"nycflights13"` package. Load (`library()`) the package.
# You'll also need to load `dplyr`
#install.packages("nycflights13")  # should be done already
library("nycflights13")
library("dplyr")

# Create a dataframe of the average arrival delays for each _destination_, then 
# use `left_join()` to join on the "airports" dataframe, which has the airport
# information
# Which airport had the largest average arrival delay?
airports_flights <- left_join(airports, flights %>% 
                                group_by(dest) %>%
                                summarise(average = mean(arr_delay, na.rm = TRUE)) %>%
                                select(faa = dest, average), by = "faa")
airports_flights %>% arrange(average) %>% head() %>% pull(faa)

# Create a dataframe of the average arrival delay for each _airline_, then use
# `left_join()` to join on the "airlines" dataframe
# Which airline had the smallest average arrival delay?
left_join(airlines, flights %>% 
                       group_by(carrier) %>%
                       summarise(average = mean(arr_delay, na.rm = TRUE)) %>%
                       select(carrier, average), by = "carrier") %>% arrange(-average) %>%
  top_n(1) %>%
  pull(name)

