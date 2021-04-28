# Project2-Actors

Date: April 7, 2021

Title: ETL Database Table

Author: Debora Rogers, Ruth Frimpong, Amon Thomas, King Nisan,& Charles Owusu-Ansah

Datasets:

https://2u-data-curriculum-team.s3.amazonaws.com/dataviz-netflix/titles_basic.csv

https://2u-data-curriculum-team.s3.amazonaws.com/dataviz-netflix/ratings.csv

https://2u-data-curriculum-team.s3.amazonaws.com/dataviz-netflix/filteredPrincipals.csv

https://2u-data-curriculum-team.s3.amazonaws.com/dataviz-netflix/filterNames.csv

Database Table 1-Actor's Table

Description: Data was extracted using the filter names csv and loaded into a dataframe. Using pyspark sql the columns were transformed to only include the relevant data. All relevant data was loaded into the Actor's table 

Includes fields: Actor's/Actresses Names, Age(int), Boolean Field(Dead/Alive/Unknown)


Database Table 2-Film Table
Description: Data was extracted using the titles_basic csv and the titles_basic csv. The data was then loaded into a dataframe which was used to determine which columns were required to create the film table. Transformations were required in the 
date time field to create a new colum. Concatenation was used to manipulate the result into datetime format. A New Database table was then created that includes all the relevant data for the film table.

Includes fields: Original title(character), Average reading (int),Film types (character), Runtime(date time), & Metadata fields


Database Table 3- Producer's Table

Description: Data was extracted using the filtered principals csv. The data was then loaded into a dataframe to determine which columns would be relevant to create a new table abs identity links to the film table. 
Transformations Included creation of a new Database table which includes only needed columns. The new table was then joined with the Films table using an inner join. All unneeded data was cleaned from the remaining
Columns and the data was loaded into the final Character Database table.

Includes fields: Producer's names(character), Links to Film Table


Database Table 4- Character's Table

Description: Data was extracted using the filteredprincipals csv.The data was then loaded into a dataframe filtering only the columns needed. The data is loaded into a Character's Database table which was then joined
with both the film and actors table's. The tables are linked by common characteristics found in the tables which are displayed in the table.

Includes fields: Unique Character Names(character), Average reading (int),Links to Film table and actor's table


Contents:
File name: NETFLIX_PROJECT_2.ipynb




