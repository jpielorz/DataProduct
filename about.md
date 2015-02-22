---
output: pdf_document
---

# Summary

Airline on-time data are reported in 2014 to the U.S. Department of Transportation (DOT), Bureau of Transportation Statistics (BTS) by the 14 U.S. air carriers that have at least 1 percent of total domestic scheduled-service passenger revenues. The data cover **nonstop scheduled-service flights between points within the United States** (including territories) as described in 14 CFR Part 234 of DOT's regulations. Data are available since January 1995. 

# Data

The airline on-time statistics data used for this assignment come originally from [RITA](http://www.transtats.bts.gov/OT_Delay/OT_DelayCause1.asp?pn=1). The data can be downloaded from there, or from the bzipped csv files at http://stat-computing.org/dataexpo/2009/the-data.html. Due to the packaging in yearly chunks on the later source and the better compression in comparison to the original files, we downloaded the [2001 data](http://stat-computing.org/dataexpo/2009/2001.csv.bz2) from there.

# Considered variables

The full dataset includes all departure and arrival statistics (scheduled departure time, actual departure time, scheduled elapse time, departure delay, wheels-off time and taxi-out time) by airport and airline; airborne time, cancellation and diversion by airport and airline.

For the purpose of our work we focussed on the variables:

* Year (yyyy)
* Month (mm)
* DayofMonth (dd)
* DepDelay (Departure Delay in minutes)
* ArrDelay (Arrival Delay in minutes)


