# export_from_access
R script for exporting tables and views out of an Access database


This is an R script, creaed January 2021, to export tables and views out of an Access database. We occasionally get government data stored in Access and need to export the tables for use in other software.

The script largely relies on RODBC package that makes an ODBC connection to the Access database. Then it allows you to pull in the names of all the tables and/or views, and then create csv files for each one.

This script should work with any Access database. Just need to change the name of the .mdb file. 
