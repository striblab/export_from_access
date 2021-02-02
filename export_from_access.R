library(RODBC)
library(tidyverse)

#directions for RODBC: https://www.rdocumentation.org/packages/RODBC/versions/1.3-17


#make connection to Access data file
#change name of access file here

dta <- odbcConnectAccess2007("2020 YE Report.mdb") 



#this will make a list of all the tables and views (saved queries) in the database
#set to =="TABLE" if you only want tables
#set to =="VIEW" if you only want saved queries
#set to  !="SYSTEM TABLE" if you want both tables and views

tables <-  as_tibble(sqlTables(dta)) %>% filter(TABLE_TYPE!='SYSTEM TABLE')



#this loops through that lists of table names and first creates a dataframe called "t1" 
#and then exports t1 contents to a csv file

for (i in 1:nrow(tables)){
  tablename = tables$TABLE_NAME[i]


t1<- sqlFetch(dta, tablename)

# export csvs
write.csv(t1, paste(tablename, '.csv', sep=""), row.names=FALSE)


}



