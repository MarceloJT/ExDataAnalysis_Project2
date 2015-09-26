#Exploratory Data Analysis
## Coursera / Johns Hopkins University Course 
##Project Assignment 02
<br/>

###Answers to the Project Questions

1. Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
Using the base plotting system, make a plot showing the total PM2.5 emission from all
sources for each of the years 1999, 2002, 2005, and 2008.<br/>
  **Answer:**  Yes, total PM 2.5 emissions have significantly declined from 1999 to 2002. 
Decreasing rate was slower from 2002 to 2005 and, once again, started a faster decrease from 2005 to 2008.

2. Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") 
from 1999 to 2008? Use the base plotting system to make a plot answering this question.<br/>
  **Answer:** The plot shows decreasing rate from 1999 to 2002, followed by an increasing rate from 2002 to 2005. 
After that, another decreasing period happens 2005 to 2008.

3. Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, 
which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? 
Which have seen increases in emissions from 1999–2008? <br/>
  **Answer:** From the data analysis we can observe that:<br/>
    -**Nonpoint (green):** A decreasing rate is observed 1999 to 2002, remaining flat from 2002 to 2005, with slow decreasing rate from 2005 to 2008.<br/>
    -**Point (purple):** Increasing rate from 1999 to 2005, then decreasing from 2005 to 2008.<br/>
    -**Onroad (blue):** Slow decreasing rates from 1999 to 2002, remaining flat from 2002 to 2005 and decreasing once again from 2005 to 2008.<br/>
    -**Nonroad (red):** Follows more or less the same trend as Onroad.<br/>

4. Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?<br/>
**Answer:** From the plot:<br/>
    -**Total (Black):** Slow decreasing trend from 1999 to 2002, slightly increasing from 2002 to 2005 and, once again, a decreasing trend from 2005 to 2008.<br/>
    -**Point (Blue):** Similar trend to the Total line.<br/>
    -**Nonpoint (Red):** Differently from the others, from 1999 to 2002 it increases. From 2002 to 2005 it remains flat and then, from 2005 to 2008, it decreases.<br/>

5. How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?<br/>
**Answer:** Decreases from 1999 till 2002, turning flat from 2002 to 2005, reducing one again from 2005 to 2008.<br/>

6. Compare emissions from motor vehicle sources in Baltimore City with emissions from motor 
vehicle sources in Los Angeles County, California (fips == "06037"). Which city has seen greater 
changes over time in motor vehicle emissions?<br/>
**Answer:** From the plot:<br/>
    -**Baltimore (Red):** Slowly drecreases from 1999 and 2002, remaining flat between 2002 and 2008.<br/>
    -**Los Angeles (Blue):** Increases from 1999 to 2005, then decreases between 2005 and 2008.
