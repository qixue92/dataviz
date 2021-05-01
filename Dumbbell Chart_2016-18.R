library(ggplot2)
library(readxl)

setwd("/Users/qixue/Desktop/Data Viz Assignment_Due 4:23")

#Data Set 1
ODAJapan_2016 <- read_excel("Japanese Bilateral ODA by Country_2016.xlsx")
df.ODAJapan_2016 <- as.data.frame(ODAJapan_2016)

View(df.ODAJapan_2016)
str(df.ODAJapan_2016)

df.ODAJapan_2016$Year <- 2016
df.ODAJapan_2016 <- df.ODAJapan_2016[,c('Year', 'Country', 'Total')]

#Data Set 2
ODAJapan_2018 <- read_excel("Japanese Bilateral ODA by Country_2018.xlsx")
df.ODAJapan_2018 <- as.data.frame(ODAJapan_2018)
df.ODAJapan_2018$Year <- 2018
df.ODAJapan_2018<-df.ODAJapan_2018[,c('Year', 'Country','Total')]

#List of interest countries
countries_var <- c("Myanmar", "Afghanistan", "Cambodia", "Philippines", 
                   "Pakistan","Bangladesh", "Viet Nam", "Iraq", "Kenya",
                   "India", "Indonesia", "Tanzania", "Laos", "Mongolia",
                   "Thailand", "Jordan", "Haiti", "Cuba")

#Filter countries
df.ODAJapan_2016 <- df.ODAJapan_2016[df.ODAJapan_2016$Country %in% countries_var,]
df.ODAJapan_2018 <- df.ODAJapan_2018[df.ODAJapan_2018$Country %in% countries_var,]

df.ODAJapan <- rbind(df.ODAJapan_2016, df.ODAJapan_2018)
df.ODAJapan$Year<-as.character(df.ODAJapan$Year)

#Define levels/order
order <- rev(countries_var)

#ggplot
ggplot(df.ODAJapan) + 
  geom_line(aes(x = Total, y = Country, group = Country), color = "darkgrey") +
  geom_point(aes(x = Total, y = Country, fill = Year),
             shape = 21, size = 5, stroke = FALSE) +
  scale_y_discrete(limits = order) +
  theme_bw() +
  theme(plot.margin = unit(c(1, 1, 1, 1), "cm")) +
  labs(title = "Japan's Cut Back on Foreign Fid to Top Reciepeints From 2016 to 2018",
       subtitle = "The exceptions are the Philippines, Bangladesh and India",
       x = "Foriegn Assistance Flows to Top Recipeints",
       y = "A list of Top Recipeints",
       caption = "Data Source: White Paper on Development Cooperation 2019 | Ministry of Foreign Affairs of Japan")

git remote add origin git@github.com:qixue92/dataviz.git
git branch -M main
git push -u origin main